#!/bin/bash

# Returns whether computer has Find My Mac enabled

fmmToken=$(/usr/sbin/nvram -x -p | /usr/bin/grep fmm-mobileme-token-FMM)

if [ -z "$fmmToken" ];
then
    echo "<result>Not Enabled</result>"
else
    echo "<result>Enabled</result>"
fi

exit 0