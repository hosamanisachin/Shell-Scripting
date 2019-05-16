#!/bin/bash
DATE=$(date +%F)
read -p "Enter the extension of the file to be found" val
echo "Extension to be found ${val}"
read -p "Enter the extension to append" var
echo "extension to be appended $var"
HERE=$(ls *${val})
#echo `pwd` //current working directory
echo "Original File names ${HERE}"
for FILE in $HERE
do
	echo "Renaming $FILE with the extension ${var}" #FILE gives the current working directory
	mv $FILE ${DATE}-${FILE}.${var}
done
