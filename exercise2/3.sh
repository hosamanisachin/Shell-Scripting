#!/bin/bash
cat /etc/shadow
var=$(echo "$?")
#if [ "$(var)" -eq "exitt status 0" ]
if [ $var == 0 ]
then
	echo "Succeded with cat /etc/shadow, exit code 0"
	exit 0
else
	echo "Command failed, exit code 1"
	exit 1
fi
