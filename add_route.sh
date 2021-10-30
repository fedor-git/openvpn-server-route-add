#!/bin/bash
workdir='./ccd'

mask2cdr ()
{
	local x=${1##*255.}
	set -- 0^^^128^192^224^240^248^252^254^ $(( (${#1} - ${#x})*2 )) ${x%%.*}
	x=${1%%$3*}
	echo $(( $2 + (${#x}/4) ))
}

get_ipaddress(){
	local str=$1
	local ip1=$2
	local ip2=$3
	echo $2
}

get_iroute(){
	local str=$1
	local ip=$2
	local mask=$3
	echo "$2/$(mask2cdr $mask)"
}

input="$workdir/$1"
while IFS= read -r line
do
	if [[ $line == *"ifconfig-push"* ]]; then
		client_ip=$(get_ipaddress $line)
	fi
	if [[ $line == *"iroute"* ]]; then
		eval "ip ro add $(get_iroute $line) via $client_ip"
	fi
done < "$input"