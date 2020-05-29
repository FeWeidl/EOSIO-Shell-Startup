#/!bin/bash
#author Felix Weidner Slock.it
#start with sudo

folder=$(pwd)
dir="$(dirname "$folder")"
echo $dir
cd $dir

function get_blocktimer {
	#Read the main string
	mainstr=$(bash cleos.sh get info)
	echo ${RED}"If you get Failed to connect, replace the following line in config.ini and run this script again."${WHITE}
	ip=$(curl ifconfig.me)
	#ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
	echo p2p-server-address = $ip:9876
	#Split the string based on the delimiter, ' '
	readarray -d , -t strarr <<< "$mainstr"
	printf "\n"

	#initialize output value
	output=""

	# check each value of the array using loop
	for (( n=0; n < ${#strarr[*]}; n++))
	do
	
		if [ $n == 6 ]
		then
		output+=${strarr[n]}
		fi
	done
	RED=$(tput setaf 1) #red colour for attention
	WHITE=$(tput sgr0)	
	
	echo -e Blocktime:	
	#echo -e ${RED}$output" | cut -f4 -d"\"
	#echo -e "Current time: $(date -u)"

	#echo $output | cut -f4 -d"\""
	#time=$(date -u '+%Y%m%d%H%M%S%3N')	
	time=$(echo $output | cut -f4 -d"\"") # | sed -r 's/[T.:-]+//g' )
	echo $time | wc -w	
	if [ $(echo $time | wc -w) -lt 1 ]
		then echo ${RED}ERROR: Change IP in config.ini to $ip:9876${WHITE}
		else
		echo ${RED}$time
	fi	
	#time=$(date +%s -d ${time})
	#echo -e ${WHITE}Blocktime is $time    
	date=$(date -u '+%Y-%m-%dT%H:%M:%S.%3N')
	echo -e ${WHITE}Time now:	
	echo -e ${RED}$date ${WHITE}
	#diff=$(( $date - $time ))
	#echo The latest known Block is $diff Milliseconds old ~$((diff / 1000)) seconds ~$((diff / 60000)) minutes
	#echo This Value might be flawed due to computation time. Timezone is UTC+0.
	
}



#if [[ $UID != 0 ]];
#	then echo "Please run as sudo"
#	echo "sudo $0 $*"
#	exit 1
	
#else
#	echo "Executing with sudo rights"
#fi

cd ..
bash wallet/start.sh
pwd
cd $dir
bash start.sh

echo opening default wallet
bash cleos.sh wallet open
bash unlock.sh


ps -a | grep nodeos
ps -a | grep keosd

get_blocktimer
echo -e "\n\nCheck the time of the latest Block and eventually wait for sync"
echo -e "Check timer with '$bash cleos.sh get info'"


echo -e "${WHITE}\ndone."






