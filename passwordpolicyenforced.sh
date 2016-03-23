#!/bin/sh

# This script checks if the existing pwpolicy (or non-existent pwpolicy) matches the desired pwpolicy
# e.g., if the string <string>Has at least 8 characters</string> exists in the current user's pwpolicy

# globally exempt local admin account not to check
exemptAccount1="administrator"

# enforced password policy to check against
PWPOLICY="<string>Has at least 8 characters</string>"

# get logged-in user and assign to a variable
LOGGEDINUSER=$(ls -l /dev/console | awk '{print $3}')

# confirm current user should not be exempt before checking their current policy
if [ "$LOGGEDINUSER" != "$exemptAccount1" ]; then
    CURRENTPWPOLICY=`pwpolicy -u $LOGGEDINUSER -getaccountpolicies | grep "$PWPOLICY"`
        if [ "$CURRENTPWPOLICY" == "" ]; then
            echo "<result>Not Enforced</result>"
        else
            echo "<result>Enforced</result>"
        fi
fi

exit 0