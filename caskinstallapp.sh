#!/bin/bash

# parameters
# $3: logged in user
# $4: cask installation trigger
# $5: app bundle name

# install app via cask-trigger parameter as local admin
su - administrator -c "/usr/local/bin/brew cask install $4"

# symlink app from admin's ~/Applications to logged in user's ~/Applications
# creating logged in user's ~/Applications first if needed
mkdir -p /Users/"$3"/Applications
ln -s /private/var/administrator/Applications/"$5" /Users/"$3"/Applications/"$5"
