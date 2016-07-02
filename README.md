# ls-nginx

```
sudo sh -c "echo iptables -t nat -I PREROUTING ! -d 10.0.0.0/23 ! -s 172.17.0.0/16 -i eno1 -p tcp --dport 80 -j REDIRECT --to-ports 3128 >> /etc/rc.local"
```
This is a temporary fix, it needs to be set each boot
```
sysctl -w net.ipv4.ip_forward=1
```
network config
```
auto eno1
iface eno1 inet static
        address 10.0.0.2
        netmask 255.255.254.0
        gateway 10.0.0.1
        dns-search ls
        dns-nameservers 8.8.8.8

auto eno1:0
iface eno1:0 inet static
        address 172.16.5.2
        netmask 255.255.255.0
```
