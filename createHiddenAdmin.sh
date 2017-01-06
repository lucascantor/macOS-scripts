#!/bin/bash

# Create hidden local admin user account

# ------------------------------------------------------------------------------------------
# Store variables

# Store this user's username (make sure it's unique)
USERNAME="admin"

# Store this user's SSH key
KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCh69XCR+xBHKHlUxQ9saOgJeTjIQ7e/1cH1/U/KIdbonc+MDLKKfMgtWTEjRCh6bgtuJnnigPh/ukte6VB9FgtKUUBumQHXFpqSIbgvop8ueP/iMoTFOKrKUqF/EGMjac8xsZbjzHj0X3h4s0eKHor+59e30ZaticYKjXZ5bRVqobUSiWU97P+08KnGvr7/AYt+7WtBFu/hIZ9Wb9hWO9nTM41RoZTtw1q0ou9lqe7Yc8dLBDPPhN5e7VbNcn6v4MMDKoJ+vL8bkpwvPTo+QveXY2EGAfApMlpv40Ij6omwZZIURgbHcOgZrPEBpNu0n8wDLhhn2Lj/+fEIY0N0ZlkoOTug8wDH5oTN67s4pc2HJG+ss135O11dLPuRMH0XvUJwxP82TOJuiA55HKPIS9ko/Wnix6KnYGjc9mS8UBX+rEOzz/hTdJoQ51VUObLzoJ2MsvNELE9Ylizxvimtd9Xx6RsGqk9XaugTW8O0kUO8/mkWg+pY6LBd4TITvj+t2zTZceX8bbuGROmhg+kmDaqzLzt0MaqBwQp0m4MbisRnQoXXZwF8gQZCsR5CaFnjJ2Zm+RaxcvgRh4UL2XpkvYKWxr22+LUheqxRmm75y8Wf50d9JQybMR4lWqZPagFZBcK1tOVhq3oZofSf4Ynjzkx4l/DY44nucB9gvL5Y+XF2Q== user@domain.tld"

# Store this user's hashed password - pulled manually from a reference user with the desired password
# e.g., sudo defaults read /var/db/dslocal/nodes/Default/users/referenceuser.plist ShadowHashData
HASH='(<62706c69 73743030 d2010203 0a5f101e 5352502d 52462335 3035342d 34303936 2d534841 3531322d 50424b44 46325f10 1453414c 5445442d 53484135 31322d50 424b4446 32d30405 06070809 58766572 69666965 72547361 6c745a69 74657261 74696f6e 734f1102 0080083a dc88a575 a37e7dad b729d287 bb237275 60eb79e2 0d05e6ef 8bd20c73 9ca8b2d9 3e8a0e2b f6a09c7f ed74ba40 536777f9 5ecaa9c3 25947fcd cff0f25f 51b4692e 7d90fa89 ebbe06ff 56c304fe 4956ab8e c866a7de 53d75c32 d24a02e4 7f44f0d8 2e55730e c39ef03a 94de765c 6ff58e79 9204b825 71902b1b 26eb9c97 da94ae0d a7b48e7e b6f565bb 172127bc 46176e95 3684da14 c90010b2 735d8ee7 2574f58d dbb21109 a8212732 8a10af7c d775582e e1affef3 7289de07 58063f6a 831d61e9 e54b0827 7593ef96 94272e7d 1b5f82c1 1e25575e 2087a904 9e41e91c da125395 9770e365 d1abb446 7ed1c368 ff30029a ee5b1c43 96b6c405 7a79943b 4fff9ae4 308bb6e9 a99fd292 fa181f0e b5b42eed 2f2f2c28 c6ffe039 804def74 2badbd53 7dd41f25 e26da2bc e5d9740d fddcf3c6 706bfb36 a35cbe4e b11d8f1d d7ba2cc4 0eb3dfb0 b08b6597 87ba49d0 791d84ca 00226d94 0937e0a9 8f0a508a 1bd2403f 4424a352 eac34be5 03df55ff 162a1e28 dbc375cc 83bbf7d6 d2be25d6 4d830739 337b7f1e a5673cb5 2a26a98a 3ca2d78c b669e4e9 0693a081 99d8fcbe 2e095a07 111e9f14 d990aa5b 363ea74a de5fa96b a3f10ce5 71a29170 10f6b355 1fa77bac 33d34d7f 2bc064bd 696b0bf0 cc21f70f 020e662d 31f01ac4 80c10d9d 79028a32 a2689740 b3eeeae0 0ca9da11 6d2538a2 09f32ef8 bec26217 e76db9df 8c4f1020 8cc876dd 8c7a6d99 96fbcc14 094da9a8 1f7c1d06 91945bec caecc439 1d98f7f7 11a91ad3 0b05060c 0d0e5765 6e74726f 70794f10 8049ca09 51c7ffd5 b812eabe d9856135 d6399da1 17df2cfc 4c317839 2d236f8a d05470a5 cb2cb9ff 63f93f28 a33e50d2 7a7c7caa 6cc77a66 843c403f f6cb3a95 19ee5f50 817b015f 647b3705 04cd7c03 e6053851 06873698 0732c07a 10de7d76 47559a85 c3e6e8f4 7de03e61 be15c4db 10a227c7 a6d0b4fe 62d29ab6 5737ed7e 2a4f1020 71e98637 2acf005c 78882dd7 f6c62c7f 5baaeebe fff28439 354e42cd 56159dcb 11a4d200 08000d00 2e004500 4c007500 5a006502 69028c02 8f029602 9e032103 44000000 00000002 01000000 00000000 0f000000 00000000 00000000 00000003 47>)'

# Store the next available UID
NEWUID=$(dscl . -list /Users UniqueID | awk 'BEGIN{i=0}{if($2>i)i=$2}END{print i+1}')

# ------------------------------------------------------------------------------------------
# Create user

# Exit with error 1 if this user's username already exists
if id "$USERNAME" >/dev/null 2>&1; then
	echo "User $USERNAME already exists. Aborting."
	exit 1
fi

# Create this user
dscl . -create /Users/"$USERNAME" IsHidden 1
dscl . -create /Users/"$USERNAME" UserShell /bin/bash
dscl . -create /Users/"$USERNAME" RealName "$USERNAME"
dscl . -create /Users/"$USERNAME" UniqueID "$NEWUID"
dscl . -create /Users/"$USERNAME" PrimaryGroupID 20
dscl . -create /Users/"$USERNAME" NFSHomeDirectory /private/var/"$USERNAME"

# Create this user's home directory
createhomedir -c

# Make this user an admin
dscl . -append /Groups/admin GroupMembership "$USERNAME"

# Set this user's password via restoring stored hash
defaults write "/var/db/dslocal/nodes/Default/users/$USERNAME.plist" ShadowHashData "$HASH"

# Hide this user and all users with UID under 500
defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add "$USERNAME"
defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool YES

# ------------------------------------------------------------------------------------------
# Configure access

# Enable ARD and allow all privledges for this user
/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -users "$USERNAME" -privs -all -restart -agent -menu

# Enable SSH server and append KEY to this user's authorized_keys file
/usr/sbin/systemsetup -setremotelogin on
mkdir -p /var/"$USERNAME"/.ssh/
echo -e "$KEY" >> /var/"$USERNAME"/.ssh/authorized_keys

# ------------------------------------------------------------------------------------------
# Confirm completion

echo -e "Local admin user $USERNAME created, hidden, granted ARD access, granted SSH access via key, prohibited from password SSH auth"

exit 0