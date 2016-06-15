#!/bin/bash

# Return whether .dead_mans_switch has been touched within the past 24 hours

if [ $(find /Users/lucas/ -mtime -1 -type f -name ".dead_mans_switch" 2>/dev/null) ]
then
	echo "Dead mans switch touched today."
else
	echo "Dead mans switch NOT touched today."
fi

exit 0