#!/bin/bash

# Enable SSH and ARD

sudo /usr/sbin/systemsetup -setremotelogin on
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -users administrator -privs -all -restart -agent -menu
