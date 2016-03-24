#!/bin/bash
#Enable Automatic Apple Software Updates

defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool yes
defaults write /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired -bool yes
schedule=$(softwareupdate --schedule on)
run_config=$(softwareupdate --background-critical)

exit 0