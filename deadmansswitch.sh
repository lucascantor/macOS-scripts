#!/bin/bash

# Shut down if ~/.dead_mans_switch not touched within past 24 hours

if [ $(find /Users/lucas/ -mtime -1 -type f -name ".dead_mans_switch" 2>/dev/null) ]
then
	echo "Dead mans switch touched today."
else
	echo "Dead mans switch NOT touched today. Shutting down now."
	/sbin/shutdown -h now
fi

exit 0