#!/bin/bash

# Demote all admin users to standard users, excluding adminusername
# Replace adminusername with name of local admin that should not be demoted

localAccts=$(dscl . list /Users UniqueID | awk '$2>500{print $1}' | grep -v adminusername)

while read account; do
    echo "Making sure $account is not in the local admin group"
    dseditgroup -o edit -d $account admin
done < <(echo "$localAccts")

exit
