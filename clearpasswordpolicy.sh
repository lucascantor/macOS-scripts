#!/bin/sh

# get logged-in user and assign it to a variable
LOGGEDINUSER=$(ls -l /dev/console | awk '{print $3}')

# Clear all pwpolocy policies for current user
pwpolicy -u "$LOGGEDINUSER" -clearaccountpolicies