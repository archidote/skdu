#!/bin/bash
read -p "Enter the name of the blocking packet (Ex : apache2)" packet
clear
rm /var/lib/dpkg/info/$packet* -f
echo -e "Action done ! "
echo -e "\e[93m Check if the problem has been resolved, with apt update && apt upgrade (option 3) \e[0m"
echo -e "Reboot to be sure :) and run apt update && apt upgrade an other time to be sure that the problem has been correctly resolved" 
echo -e "This error can appears after a big update or the installation of a broken packet"

echo -e "Press enter to continue"
read
clear