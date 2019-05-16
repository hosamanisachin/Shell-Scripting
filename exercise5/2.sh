#!/bin/bash

#read -p "Enter y or n:" ANSWER
case $1 in
	start)
		echo "you answered start"
		/tmp/sleep-walking-server &
		;;
	stop)
		echo "you answered stop"
		kill -KILL $(cat /tmp/sleep-walking-server.pid)
		;;
	*)
	echo "Usage sleep-walking start|stop"
	exit 1
	;;
esac
