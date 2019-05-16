#!/bin/bash
var=$(ls /root/shell/*)
for FILE in $var
do
	if [ -x /root/shell/exercise5/$FILE ]
	then 
		echo "File Exists"
	else
		echo "File doesnt exits"
	fi
done


