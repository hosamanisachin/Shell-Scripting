#!/bin/bash
function ask()
{
	read -p "Type the directory" ddir
#	return ddir
}

function file_count()
{
# to check the number of lines in this file	
#	wc -l /root/shell/exercise3/1.sh
	ask
	var=$(ls -1 $ddir | wc -l)

	echo $var

}

file_count
