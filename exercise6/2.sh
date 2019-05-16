#!/bin/bash
read -p "Enter the number of lines to read" var
LINE=0
cat /etc/passwd | while read ONE
do	
	if [ $LINE -eq $var ]
	then
		exit 0
	else
		echo "${LINE}: ${ONE}"
		((LINE++))
	fi
done

