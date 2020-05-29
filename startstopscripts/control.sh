#!/bin/bash
#author Felix Weidner Slock.it
dir=$(pwd)

case "$1" in
	start)
		bash $dir/startall.sh
	;;
	stop)
		bash $dir/stopall.sh
	;;
	*)
	echo $"USAGE: $0 {start|stop}"
	exit 1
esac

		
