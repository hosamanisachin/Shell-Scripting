#!/bin/bash
DATE=$(date +%F)
HERE=$(ls *jpg)
#echo `pwd` //current working directory
for FILE in $HERE
do
	echo "Copying $FILE" #FILE gives the current working directory
	mv $FILE ${DATE}-${FILE}
done
