#!/bin/bash

function file_count()
{
# to check the number of lines in this file	
#	wc -l /root/shell/exercise3/1.sh
	var=$(ls -1 /root/shell/ | wc -l)
	echo $var

}

file_count
