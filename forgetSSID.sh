#!/bin/sh

for interface in $(networksetup -listnetworkserviceorder | grep Hardware | awk '/Wi-Fi/ { print $NF }' | awk -F ")" '{ print $1 }')
do
    echo "Forgetting non-preferred SSID for $interface"
    networksetup -removepreferredwirelessnetwork $interface YourNetworkSSIDHere
done
