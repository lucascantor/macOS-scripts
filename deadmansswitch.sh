#!/bin/bash

# Return whether .dead_mans_switch has been touched within the past 24 hours

if [ $(find /Users/lucas/ -mtime -1 -type f -name ".dead_mans_switch" 2>/dev/null) ]
then
	echo "Dead man\'s switch touched today."
else
	echo "Dead man\'s switch NOT touched today."
fi

exit 0