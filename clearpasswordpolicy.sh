#!/bin/sh

# Clear all pwpolocy policies for current user
pwpolicy -u "$3" -clearaccountpolicies
