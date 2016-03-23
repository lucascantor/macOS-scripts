#!/bin/bash

# Append rules to to sshd_config to prohibit password ssh auth for admin user

echo -e "\n# Prohibit password authentication for administrator user\nMatch User administrator\n\tKbdInteractiveAuthentication no\n\tPasswordAuthentication no" >> /etc/ssh/sshd_config
