# openvpn-server-route-add
this simple script for create route for clients

- this example has only `client1` for test
- usage
1) Set workdir with your ccd (Client Config Dir) in ./src/config.conf ```workdir='./ccd'```
2) Check the right config path in files `route-static.sh` and `route-dynamic.sh`
3) Add in OpenVPN server config:
```
script-security 2
client-connect "/etc/openvpn/updown.sh connect"
client-disconnect "/etc/openvpn/updown.sh disconnect"
user root
group nogroup
```
4) Check config directory in `updown.sh`
5) Set ifconfig static or dynamic in `updown.sh`