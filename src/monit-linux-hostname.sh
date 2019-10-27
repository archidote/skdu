#!/bin/bash
clear
read -p "enter the new hostname of your machine (like : debian ) : " hostname
read -p "enter the .tld for the hostname (like .com)"tld
hostnamectl set-hostname $hostname.$tld
sed -i -r "s/.*127.0.0.1.*/127.0.0.1 $hostname.$tld $hostname /g" /etc/hosts
sed -i -r "s/.*127.0.1.1.*/127.0.1.1 $hostname.$tld $hostname /g" /etc/hosts
echo -e "your new hostname is : $hostname.$tld"
echo -e "Reboot your machine to apply definitely the changes"
echo -e "press enter to continue" 
read 

