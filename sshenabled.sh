#!/bin/bash

# Returns whether SSH is enabled

STATUS=$(systemsetup -getremotelogin)

if [ "$STATUS" == "Remote Login: On" ]; then
        echo "<result>Enabled</result>"
else
        echo "<result>Disabled</result>"
fi
exit 0
