#!/bin/bash

# Remove standalone Adobe Flash installation

to_remove=(
"/Applications/Utilities/Adobe Flash Player Install Manager.app"
"/Library/Internet Plug-Ins/Flash Player.plugin"
"/Library/Internet Plug-Ins/flashplayer.xpt"
"/Library/PreferencePanes/Flash Player.prefPane"
"/Library/Receipts/Adobe Flash Player.pkg"
)

for item in "${to_remove[@]}"; do
    rm -rf "${item}"
done
