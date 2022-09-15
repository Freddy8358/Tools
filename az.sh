#!/bin/bash

# update
apt update && apt full-upgrade -y && apt autoremove -y 

# remove agent
apt --purge autoremove -y linux-azure-* linux-cloud-tools-* walinuxagent 
pkill -9 hv_kvp_daemon
apt --purge autoremove *google* -y

# bbr
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p

# ipv4 precedence
echo "precedence ::ffff:0:0/96  100" >> /etc/gai.conf

reboot