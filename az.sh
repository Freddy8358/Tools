apt update && apt full-upgrade -y && apt autoremove -y 

apt --purge autoremove -y linux-azure-* linux-cloud-tools-* walinuxagent 
pkill -9 hv_kvp_daemon

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p

sysctl net.ipv4.tcp_congestion_control

reboot