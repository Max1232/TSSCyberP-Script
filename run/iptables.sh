#!/bin/bash

#Ip tables
apt-get install -y iptables
apt-get install -y iptables-persistent

iptables -t nat -F
		iptables -t mangle -F
		iptables -t nat -X
		iptables -t mangle -X
		iptables -F
		iptables -X
		iptables -P INPUT DROP
		iptables -P FORWARD DROP
		iptables -P OUTPUT ACCEPT
		ip6tables -t nat -F
		ip6tables -t mangle -F
		ip6tables -t nat -X
		ip6tables -t mangle -X
		ip6tables -F
		ip6tables -X
		ip6tables -P INPUT DROP
		ip6tables -P FORWARD DROP
		ip6tables -P OUTPUT DROP

		iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 23 -j DROP         #Block Telnet
		iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 2049 -j DROP       #Block NFS
		iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 2049 -j DROP       #Block NFS
		iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 6000:6009 -j DROP  #Block X-Windows
		iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 7100 -j DROP       #Block X-Windows font server
		iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 515 -j DROP        #Block printer port
		iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 515 -j DROP        #Block printer port
		iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 111 -j DROP        #Block Sun rpc/NFS
		iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 111 -j DROP        #Block Sun rpc/NFS
		iptables -A INPUT -p all -s localhost -i eth0 -j DROP
		iptables -A INPUT -s 127.0.0.0/8 -i firefox -j DROP
		iptables -A INPUT -s 0.0.0.0/8 -j DROP
		iptables -A INPUT -s 100.64.0.0/10 -j DROP
		iptables -A INPUT -s 169.254.0.0/16 -j DROP
		iptables -A INPUT -s 192.0.0.0/24 -j DROP
		iptables -A INPUT -s 192.0.2.0/24 -j DROP
		iptables -A INPUT -s 198.18.0.0/15 -j DROP
		iptables -A INPUT -s 198.51.100.0/24 -j DROP
		iptables -A INPUT -s 203.0.113.0/24 -j DROP
		iptables -A INPUT -s 224.0.0.0/3 -j DROP
		iptables -A OUTPUT -d 127.0.0.0/8 -o $interface -j DROP
		iptables -A OUTPUT -d 0.0.0.0/8 -j DROP
		iptables -A OUTPUT -d 100.64.0.0/10 -j DROP
		iptables -A OUTPUT -d 169.254.0.0/16 -j DROP
		iptables -A OUTPUT -d 192.0.0.0/24 -j DROP
		iptables -A OUTPUT -d 192.0.2.0/24 -j DROP
		iptables -A OUTPUT -d 198.18.0.0/15 -j DROP
		iptables -A OUTPUT -d 198.51.100.0/24 -j DROP
		iptables -A OUTPUT -d 203.0.113.0/24 -j DROP
		iptables -A OUTPUT -d 224.0.0.0/3 -j DROP
		iptables -A OUTPUT -s 127.0.0.0/8 -o $interface -j DROP
		iptables -A OUTPUT -s 0.0.0.0/8 -j DROP
		iptables -A OUTPUT -s 100.64.0.0/10 -j DROP
		iptables -A OUTPUT -s 169.254.0.0/16 -j DROP
		iptables -A OUTPUT -s 192.0.0.0/24 -j DROP
		iptables -A OUTPUT -s 192.0.2.0/24 -j DROP
		iptables -A OUTPUT -s 198.18.0.0/15 -j DROP
		iptables -A OUTPUT -s 198.51.100.0/24 -j DROP
		iptables -A OUTPUT -s 203.0.113.0/24 -j DROP
		iptables -A OUTPUT -s 224.0.0.0/3 -j DROP
		iptables -A INPUT -d 127.0.0.0/8 -i $interface -j DROP
		iptables -A INPUT -d 0.0.0.0/8 -j DROP
		iptables -A INPUT -d 100.64.0.0/10 -j DROP
		iptables -A INPUT -d 169.254.0.0/16 -j DROP
		iptables -A INPUT -d 192.0.0.0/24 -j DROP
		iptables -A INPUT -d 192.0.2.0/24 -j DROP
		iptables -A INPUT -d 198.18.0.0/15 -j DROP
		iptables -A INPUT -d 198.51.100.0/24 -j DROP
		iptables -A INPUT -d 203.0.113.0/24 -j DROP
		iptables -A INPUT -d 224.0.0.0/3 -j DROP
		iptables -A INPUT -i lo -j ACCEPT
		iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
		iptables -A INPUT -p tcp --match multiport --sports 1:1022 -m conntrack --ctstate ESTABLISHED -j ACCEPT
		iptables -A INPUT -p udp --match multiport --sports 1:1022 -m conntrack --ctstate ESTABLISHED -j ACCEPT
		iptables -A OUTPUT -p tcp --match multiport --dports 1:1022 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
		iptables -A OUTPUT -p udp --match multiport --dports 1:1022 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
		iptables -A OUTPUT -o lo -j ACCEPT
		iptables -P OUTPUT DROP
		iptables -A INPUT -p tcp --sport 80 -m conntrack --ctstate ESTABLISHED -j ACCEPT
		iptables -A INPUT -p tcp --sport 443 -m conntrack --ctstate ESTABLISHED -j ACCEPT
		iptables -A INPUT -p tcp --sport 53 -m conntrack --ctstate ESTABLISHED -j ACCEPT
		iptables -A INPUT -p udp --sport 53 -m conntrack --ctstate ESTABLISHED -j ACCEPT
		iptables -A OUTPUT -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
		iptables -A OUTPUT -p tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
		iptables -A OUTPUT -p tcp --dport 53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
		iptables -A OUTPUT -p udp --dport 53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
		iptables -A OUTPUT -o lo -j ACCEPT
		iptables -P OUTPUT DROP
		mkdir /etc/iptables/
		touch /etc/iptables/rules.v4
		touch /etc/iptables/rules.v6
		iptables-save > /etc/iptables/rules.v4
ip6tables-save > /etc/iptables/rules.v6
