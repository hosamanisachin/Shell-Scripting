#!/bin/bash
#var="Shell scripting is fun"
read -p "Enter the file name" var

if [ -d /root/shell/exercise1/$var ]
then 
	echo "It is a directory"
elif [ -f /root/shell/exercise1/$var ]
then 
	echo "Is a regular file"
else [ -s /root/shell/exercise1/$var ]
	echo "Is other type of file"
fi
var2=$( ls -l  /root/shell/exercise1/ )
for pic in $var2
do
echo "${pic}"
done
