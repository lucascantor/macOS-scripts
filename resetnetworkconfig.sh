#!/bin/bash

# Remove network config files to reset to factory defaults

to_remove=(
"/Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist"
"/Library/Preferences/SystemConfiguration/com.apple.network.identification.plist"
"/Library/Preferences/SystemConfiguration/com.apple.wifi.message-tracer.plist"
"/Library/Preferences/SystemConfiguration/NetworkInterfaces.plist"
"/Library/Preferences/SystemConfiguration/preferences.plist"
)

for item in "${to_remove[@]}"; do
    rm -rf "${item}"
done
