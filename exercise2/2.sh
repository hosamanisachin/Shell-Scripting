#!/bin/bash
if [ -f /root/shell/exercise2/$1 ]
then
	echo "Regular File"
	echo "Exit status 0"
	exit 0
elif [ -d /root/shell/exercise2/$1 ]
then 
	echo "Directory"
	echo "Exit status 1"
	exit 1
else  
	echo "Other-type File"
	echo "Exit status 2"
	exit 2
fi
