#!/bin/bash
# Example:
# ./route-dynamic.sh username user_ip [ up/down ]
. /etc/openvpn/src/config.conf

mask2cdr ()
{
        local x=${1##*255.}
        set -- 0^^^128^192^224^240^248^252^254^ $(( (${#1} - ${#x})*2 )) ${x%%.*}
        x=${1%%$3*}
        echo $(( $2 + (${#x}/4) ))
}

get_iroute(){
        local str=$1
        local ip=$2
        local mask=$3
        echo "$2/$(mask2cdr $mask)"
}

routes(){
    local username=$1
    local userip=$2
    local task=$3
    local input="$workdir/$1"

 while IFS= read -r line
  do
        if [[ $line == *"iroute"* ]]; then
                if [[ $task == "up" ]]; then
                  eval "ip ro add $(get_iroute $line) via $userip"
                elif [[ $task == "down" ]]; then
                  eval "ip ro del $(get_iroute $line) via $userip"
                fi
        fi
  done < "$input"
}

case "$3" in
 "up" )
 $(routes $1 $2 $3)
 ;;
 "down" )
 $(routes $1 $2 $3)
 ;;
 * )
 echo "Error input"
 ;;
esac