#!/bin/bash
#used to build a project in continuous

while [ 1 ]
do
	clear
	date
	make "$@" && make "$@"
	read
done
