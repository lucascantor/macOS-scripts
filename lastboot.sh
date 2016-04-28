#!/bin/bash

# Returns date and time of last boot for "before" or "after" a certain date, or "in the last X days" comparisons

echo "<result>$(date -jf "%s" "$(sysctl kern.boottime | awk -F'[= |,]' '{print $6}')" +"%Y-%m-%d %T")</result>"
