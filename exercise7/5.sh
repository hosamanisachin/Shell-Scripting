#!/bin/bash -v
case $1 in
	1 )
		echo "`ls /root/shell/`"
		exit 0
		;;
	2 )
		echo "`ls /root/shell/exercise10/`"
		exit 1
		;;
	3 )
		echo "`ls /root/shell/exercise6/`"
		exit 0
		;;
esac

