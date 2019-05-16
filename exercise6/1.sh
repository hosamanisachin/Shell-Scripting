#!/bin/bash

LINE=1
cat xfs /etc/passwd | while read ONE
do
	echo "${LINE}: ${ONE}"
	((LINE++))
done

