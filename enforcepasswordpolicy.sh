#!/bin/sh
##########################################################################################################
## Pupose:  Create a pwpolicy XML file based upon variables and options included below.
##          Policy is applied and then file gets deleted. Use "sudo pwpolicy -u <user> -getaccountpolicies"
##          to see it, and "sudo pwpolicy -u <user> -clearaccountpolicies" to clear it.
## 
## Usage:   Only edit the variables in the Variable flowerbox below.
##          Run as a policy from Casper, or standalone as root.
##
## Tested on: OS X 10.10 and 10.11
##
## Authors: Danny Friedman, Civis Analytics IT Manager, CCA, civisanalytics.com
##          Jeff Holland, Civis Analytics Sr. Security Engineer, CISSP/GCUX, civisanalytics.com
#########################################################################################################

# get logged-in user and assign it to a variable
LOGGEDINUSER=$(ls -l /dev/console | awk '{print $3}')

echo "LOGGEDINUSER is: $LOGGEDINUSER"

##############################################################################
# Variables for script and commands generated below.
#
# EDIT AS NECESSARY FOR YOUR OWN PASSWORD POLICY
# AND COMPANY INFORMATION
#
COMPANY_NAME="luciddg.com"      # Company name
LOCKOUT=60                      # 1 minute lockout
MAX_FAILED=10                   # 10 max failed logins before locking
MIN_LENGTH=8                    # at least 8 chars for password

exemptAccount1="administrator"  #Exempt account used for remote management.
#
##############################################################################

#################################################
##### create pwpolicy.plist in /private/var/tmp
# Password policy using variables above is:
# Change as necessary in variable flowerbox above
# --------------------------------------------------
# pw's must be at least 8 chars
# 10 failed login attempts results in a 60 second lockout

echo "<dict>
 <key>policyCategoryAuthentication</key>
  <array>
   <dict>
    <key>policyContent</key>
     <string>(policyAttributeFailedAuthentications &lt; policyAttributeMaximumFailedAuthentications) OR (policyAttributeCurrentTime &gt; (policyAttributeLastFailedAuthenticationTime + autoEnableInSeconds))</string>
    <key>policyIdentifier</key>
     <string>Authentication Lockout</string>
    <key>policyParameters</key>
  <dict>
  <key>autoEnableInSeconds</key>
   <integer>$LOCKOUT</integer>
   <key>policyAttributeMaximumFailedAuthentications</key>
   <integer>$MAX_FAILED</integer>
  </dict>
 </dict>
 </array>


  <key>policyCategoryPasswordContent</key>
 <array>
  <dict>
   <key>policyContent</key>
    <string>policyAttributePassword matches '.{$MIN_LENGTH,}+'</string>
   <key>policyIdentifier</key>
    <string>Has at least $MIN_LENGTH characters</string>
   <key>policyParameters</key>
   <dict>
    <key>minimumLength</key>
     <integer>$MIN_LENGTH</integer>
   </dict>
  </dict>

 </array>
</dict>" > /private/var/tmp/pwpolicy.plist
##### end of pwpolicy.plist generation script
###################################################

#Check for non-admin account before deploying policy
if [ "$LOGGEDINUSER" != "$exemptAccount1" ]; then
  chown $LOGGEDINUSER:staff /private/var/tmp/pwpolicy.plist
  chmod 644 /private/var/tmp/pwpolicy.plist

  # clear account policy before loading a new one
  pwpolicy -u $LOGGEDINUSER -clearaccountpolicies 
  pwpolicy -u $LOGGEDINUSER -setaccountpolicies /private/var/tmp/pwpolicy.plist

elif [ "$LOGGEDINUSER" == "$exemptAccount1" ]; then
    echo "Currently $exemptAccount1 is logged in and the password policy was NOT set. This script can only be run if the standard computer user is logged in."
    rm -f /private/var/tmp/pwpolicy.plist
    exit 1
fi

#delete staged pwploicy.plist
rm -f /private/var/tmp/pwpolicy.plist

echo "Password policy successfully applied. Run \"sudo pwpolicy -u <user> -getaccountpolicies\" to see it."
exit 0
