#!/bin/bash
clear
read -p "Enter the name of the blocking packet (Ex : apache2)" packet
rm /var/lib/dpkg/info/$packet* -f
echo -e "Action done ! "
echo -e "\e[93mCheck if the problem has been resolved, with apt update && apt upgrade \e[0m"
echo -e "Reboot to be sure :)" 
echo -e "Press enter to continue"
read
clear
