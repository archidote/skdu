#!/bin/bash 
clear
rm -f /var/lib/dpkg/lock
echo -e "Action done ! "
echo -e "\e[93m Check if the problem has been resolved, with apt update && apt upgrade (option 3) \e[0m"
echo -e "This error can appears after a big update or the installation of a broken packet"
echo -e "Reboot to be sure :) and check once again option 3" 
echo -e "Press enter to continue"
read
clear