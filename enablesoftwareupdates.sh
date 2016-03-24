#!/bin/bash

#Enable Automatic Apple Software Updates

defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool TRUE
defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool TRUE
defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool TRUE
defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool TRUE
defaults write /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired -bool TRUE
schedule=$(softwareupdate --schedule on)
run_config=$(softwareupdate --background)

exit 0