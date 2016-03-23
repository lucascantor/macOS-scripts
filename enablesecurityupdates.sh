#!/bin/bash

#Enable Automatic Apple Security Updates

defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool yes
defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool yes
schedule=$(softwareupdate --schedule on)
run_config=$(softwareupdate --background-critical)

exit 0