#!/bin/bash
clear
# Creates a backup
echo -e "\e[93m WARNING \e[0m, you will change the ip address of your server. Make sure that you have a physical access to him. TAP CTRL C for cancel the action"
echo -e ""
if [ -d "/etc/network/backup" ];then
    echo ""
	# echo "Le dossier /etc/netplan/backup est déjà présent sur le système";
else
	mkdir /etc/network/backup
	echo "/etc/network/backup has been created ! "
	echo -e "Nb : a backup of your current configuration file (/etc/network/interfaces) has been released check /etc/network/backup/* for more"
fi
cp /etc/network/interfaces /etc/network/backup/interfaces_backup_`date +%Y%m%d%H%M`
# Changes dhcp from 'yes' to 'no'
# sed -i "s/dhcp4: yes/dhcp4: no/g" $locateNetplan
# Retrieves the NIC information
nic=`ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}' | cut -c2- | head -1`
# Ask for input on network configuration
# /usr/sbin/ifdown $nic
read -p "Configure the network with DHCP ? (O/n) : " dhcp
dhcp=${rep:-O}
if [ $dhcp = 'O' ] || [ $dhcp = 'o' ]; then
cat > /etc/network/interfaces << EOF
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
allow-hotplug $nic
iface $nic inet dhcp
EOF

else 
read -p "Enter the static IP (ex : 192.168.0.10) : " staticip
read -p "Entrer the netmask (ex : 255.255.255.0) : " netmask
read -p "Enter the IP of your gateway : " gateway
read -p "Enter a dns ip : " dns1
read -p "Enter a second dns  ip : " dns2
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
fi
systemctl restart networking
echo -e "\e[92m Your ip address has been changed ! \e[0m (/etc/network/interfaces)"
echo -e "Press enter to continue"
read
clear
