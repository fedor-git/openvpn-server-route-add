# openvpn-server-route-add
this simple script for create route for clients

- this example has only `client1` for test
- usage
1) set workdir with your ccd (Client Config Dir) in ./src/config.conf ```workdir='./ccd'```
2) check the right config path in files `route-static.sh` and `route-dynamic.sh`
2) Add in OpenVPN server config:
```
script-security 2
client-connect "/etc/openvpn/updown.sh connect"
client-disconnect "/etc/openvpn/updown.sh disconnect"
user root
group nogroup
```