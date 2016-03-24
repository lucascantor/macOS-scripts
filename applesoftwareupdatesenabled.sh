#!/bin/bash
#Script to verify the status of Auto Updates
#to ensure App Store and OS X updates are applied

### Check for schedule, App Store and OS X settings
schedule_status=$(softwareupdate --schedule)
app_store_status=$(defaults read /Library/Preferences/com.apple.commerce AutoUpdate 2>/dev/null)
os_x_status=$(defaults read /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired 2>/dev/null)
run_config=$(softwareupdate --background-critical)

### Desired settings for schedule, critical and config
schedule_on="Automatic check is on"
app_store_on="1"
os_x_on="1"


if [ "$schedule_status" == "$schedule_on" ] && [ "$app_store_status" == "$app_store_on" ] && [ "$os_x_status" == "$os_x_on" ]; then

    echo "<result>Enabled</result>"
else
    echo "<result>Disabled</result>"
fi

exit 0