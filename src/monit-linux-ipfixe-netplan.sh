#!/bin/bash
#
# Creates a backup
echo -e "WARNING, you will change the ip address of your server. Make sure that you have a physical access to him. TAP CTRL C for cancel the action"
if [ -d "/etc/netplan/backup" ];then
 echo "Le dossier /etc/netplan/backup est déjà présent sur le système";
else
mkdir /etc/netplan/backup
echo "/etc/netplan/backup has been created ! "
fi
locateNetplan=`find /etc/netplan/ -name "*.yaml" | cut -c14-`
cp /etc/netplan/$locateNetplan /etc/netplan/backup/netplan_`date +%Y%m%d%H%M`
# Changes dhcp from 'yes' to 'no'
# sed -i "s/dhcp4: yes/dhcp4: no/g" $locateNetplan
# Retrieves the NIC information
nic=`ifconfig | awk 'NR==1{print $1}'`
# Ask for input on network configuration
read -p "Enter the static IP in CIDR notation : (ex :x.x.x.x/CIDR) " staticip 
read -p "Enter the IP of your gateway : " gatewayip
read -p "Enter the first dns ip :" dns1
read -p "enter the second dns ip : " dns2
echo
cat > /etc/netplan/$locateNetplan <<EOF
network:
  version: 2
  renderer: networkd
  ethernets:
    $nic
      dhcp4: no
      addresses:
        - $staticip
      gateway4: $gatewayip
      nameservers:
          addresses: [$dns1, $dns2]
EOF
cat > /etc/resolv.conf <<EOF
domain localdomain
search localdomain
nameserver $dns1
nameserver $dns2
EOF
sudo netplan apply
echo "Your ip address has been changed ! (with netplan daemon)"
echo
