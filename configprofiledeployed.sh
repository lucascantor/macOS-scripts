#!/bin/sh

# Returns whether specified config profile is deployed

profiles=`profiles -C -v | grep "CONFIG_PROFILE_NAME_HERE"`
if [[ ! -z "$profiles" ]]; then
    echo "<result>deployed</result>"
else
    echo "<result>not-deployed</result>"
fi

exit 0
