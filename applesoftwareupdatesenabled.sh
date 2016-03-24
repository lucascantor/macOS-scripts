#!/bin/bash

# Script to verify the status of Auto Updates
# to apply Critical, Security, App Store, and OS X updates

### Check for schedule, download, critical, config, App Store, and OS X settings
schedule_status=$(softwareupdate --schedule)
download_status=$(defaults read /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload 2>/dev/null)
critical_status=$(defaults read /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall 2>/dev/null)
config_status=$(defaults read /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall 2>/dev/null)
app_store_status=$(defaults read /Library/Preferences/com.apple.commerce AutoUpdate 2>/dev/null)
os_x_status=$(defaults read /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired 2>/dev/null)
run_config=$(softwareupdate --background)

### Desired settings for schedule, download, critical, config, App Store, and OS X
schedule_on="Automatic check is on"
download_on="1"
critical_on="1"
config_on="1"
app_store_on="1"
os_x_on="1"


if [ "$schedule_status" == "$schedule_on" ] && [ "$download_status" == "$download_on" ] && [ "$critical_status" == "$critical_on" ] && [ "$config_status" == "$config_on" ] && [ "$app_store_status" == "$app_store_on" ] && [ "$os_x_status" == "$os_x_on" ]; then

    echo "<result>Enabled</result>"
else
    echo "<result>Disabled</result>"
fi

exit 0