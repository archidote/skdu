#!/bin/bash 
clear
rm -f /var/lib/dpkg/lock
echo -e "Action done ! "
echo -e "\e[93mCheck if the problem has been resolved, with apt update && apt upgrade\e[0m"
echo -e "Reboot to be sure :)" 
echo
echo -e "Press enter to continue"
read
clear