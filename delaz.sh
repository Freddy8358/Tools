apt --purge autoremove -y linux-azure-* 
apt --purge autoremove -y linux-cloud-tools-* 
apt --purge autoremove -y waagent 
apt --purge autoremove -y walinuxagent 
apt --purge autoremove -y *google*
pkill -9 hv_kvp_daemon