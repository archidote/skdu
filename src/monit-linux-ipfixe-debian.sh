#!/bin/bash
# Creates a backup
echo -e "WARNING, you will change the ip address of your server. Make sure that you have a physical access to him. TAP CTRL C for cancel the action"
if [ -d "/etc/network/backup" ];then
	echo "Le dossier /etc/netplan/backup est déjà présent sur le système";
else
	mkdir /etc/network/backup
	echo "/etc/network/backup has been created ! "
fi
cp /etc/network/interfaces /etc/network/backup/interfaces_backup_`date +%Y%m%d%H%M`
# Changes dhcp from 'yes' to 'no'
# sed -i "s/dhcp4: yes/dhcp4: no/g" $locateNetplan
# Retrieves the NIC information
nic=`ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}' | cut -c2-`
# Ask for input on network configuration
ifdown $nic
read -p "Enter the static IP : " staticip
read -p "Entrer the netmask : " netmask
read -p "Enter the IP of your gateway : " gateway
read -p "Enter a dns ip : " dns1
read -p "Enter a second dns  ip : " dns2
echo
cat > /etc/network/interfaces << EOF
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).
 
# The loopback network interface
auto lo
iface lo inet loopback
auto $nic
iface $nic inet static
        address $staticip
        netmask $netmask
        gateway $gateway
        # dns-* options are implemented by the resolvconf package, if installed
        dns-nameservers $dns1 $dns2
EOF
cat > /etc/resolv.conf << EOF
domain localdomain
search localdomain
nameserver $dns1
nameserver $dns2
EOF
#systemctl restart networking
ifup $nic
echo "Your ip address has been changed ! (with netplan daemon)"
echo
