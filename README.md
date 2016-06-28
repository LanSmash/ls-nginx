# ls-nginx

sudo sh -c "echo iptables -t nat -I PREROUTING ! -d 10.0.0.0/23 -i eno1 -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 3128 >> /etc/rc.local"
