#!/bin/bash

# Enable SSH and ARD

/usr/sbin/systemsetup -setremotelogin on
/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -users administrator -privs -all -restart -agent -menu
