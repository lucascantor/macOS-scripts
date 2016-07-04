#!/bin/sh

# Get the wifi interface ID
WifiInterface=$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')

# Inventory preferred (remembered) wifi SSIDs
PreferredNetworks=$(networksetup -listpreferredwirelessnetworks "$WifiInterface" | sed 's/^   //g')

# Return the list of preffered wifi SSIDs
echo "<result>$PreferredNetworks</result>"
