#!/bin/bash
#var="Shell scripting is fun"
if [ -e /etc/shadow ]
then  
	echo "Shadow passwords are enabled"
	if [ -w /etc/shadow ]
	then 
		echo "You have permission to edit /etc/shadow"
	else
		echo "You cannot edit /etc/shadow."
	fi
else
echo "Not present"
fi


