#!/bin/bash

read -p "Enter y or n:" ANSWER
case "$ANSWER" in
	[yY] | [yY] [eE] [sS])
		echo "you answered yes."
		;;
	[nN] | [nN] [oO])
		echo "you answered no."
		;;
	*)
	echo "Invalid answer"
	;;
esac
