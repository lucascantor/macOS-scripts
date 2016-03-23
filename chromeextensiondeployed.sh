#!/bin/bash

# Return whether given extension for Chrome has been deployed to this Mac

if [ -f /Library/Application\ Support/Google/Chrome/External\ Extensions/EXTENSION_ID_HERE.json ]
then
	echo "<result>deployed</result>"
else
	echo "<result>not-deployed</result>"
fi
