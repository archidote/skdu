#!/bin/bash
clear
echo -e "\e[93m"
echo -e "cleaning up  ... "
echo -e "\e[0m"
apt-get autoremove
apt-get purge
echo -e " \e[92m the OS has been cleaned. \e[0m "
echo -e "Press enter to continue"
read
clear
