#!/bin/bash
#author Felix Weidner Slock.it
folder=$(pwd)
dir="$(dirname "$folder")"
echo $dir
cd $dir

#if [[ $UID != 0 ]];
#	then echo "Please run as sudo"
#	echo "sudo $0 $*"
#	exit 1
#	
#else
#	echo "Executing with sudo rights"
#fi

echo stopping nodeos...
bash stop.sh
echo stopping keosd...
cd ..
bash wallet/stop.sh
cd $dir
pwd
nodestatus=$(ps -a | grep nodeos)
keosdstatus=$(ps -a | grep keosd)

declare -i nodel=$(echo $nodestatus | wc -c)
#echo $nodel
declare -i keosdl=$(echo $keosdstatus | wc -c)
#echo $keosdl

declare -i testsum
testsum=$nodel+$keosdl
echo $testsum

if [ $nodel -gt "1" ] || [ $keosdl -gt "1" ];
	then echo check your Scripts and try again
	exit 1
else
	echo "Keosd and Nodeos are currently not running on your System (anymore)"
fi

echo done.
