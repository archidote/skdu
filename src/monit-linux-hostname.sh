#!/bin/bash
clear
read -p "enter the new hostname of your machine (like : server.local ) : " hostname
hostnamectl set-hostname $hostname
sed -i -r "s/.*127.0.0.1.*/127.0.0.1 $hostname /g" /etc/hosts
sed -i -r "s/.*127.0.1.1.*/127.0.1.1 $hostname /g" /etc/hosts
echo -e "your new hostname : $hostname "
