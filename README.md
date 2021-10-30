# openvpn-server-route-add
this simple script for create route for clients

- this example has client1
- usage
1) set workdir with your ccd (Client Config Dir):
2) Run script:
```workdir='./ccd'```
```
./add_route.sh client1

ip ro add 10.10.0.0/24 via 192.168.10.5
ip ro add 10.11.0.0/24 via 192.168.10.5
```
