#!/bin/bash
openvpn_config_dir="/etc/openvpn"
# static = true
# dynamic = false
static=true
# ./route-static.sh username [ up/down ]
# ./route-dynamic.sh username user_ip [ up/down ]

if $static ; then
 script='route-static.sh'
else
 script='route-dynamic.sh'
fi

case "$1" in
"connect" )
if $static ; then
 eval "$openvpn_config_dir/src/$script $common_name up"
else
 eval "$openvpn_config_dir/src/$script $common_name $ifconfig_pool_remote_ip up"
fi
;;
"disconnect" )
if $static ; then
 eval "$openvpn_config_dir/src/$script $common_name down"
else
 eval "$openvpn_config_dir/src/$script $common_name $ifconfig_pool_remote_ip down"
fi
;;
* )
echo "Error input"
;;
esac