#!/bin/bash -x

LINE=1
while [ 1 ]   
do
read -p "Enter option 1.Disk Usage 2.Uptime 3.Users q.quit" var

	case "$var" in
	  1 )
		df
		;;
	  2 )
		uptime
	
	;;
	3 )
		who
	;;
	 [q])
		echo "GOODBYE!"
		exit 0
	;;
	
	esac
done

