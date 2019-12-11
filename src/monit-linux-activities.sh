#!/bin/bash
clear
x=0
echo -e "REMEMBER, The scanning of ports can be considered illegal. It should not be used by an administrator on his own network to check his security."
echo -e "***********************************************************"
echo -e "| - Sub menu for follow the activities (general / user) - |"
echo -e "***********************************************************"
while [ x != 1 ] 
do
clear
echo -e ""
echo -e "  1) Follow the general activities of the OS"
echo -e "  2) Follow the activities of an user "
echo -e "  3) Check the latest commands (typed) of an user: "
echo -e "  4) Leave the sub-menu"
read -p "Select an option : " nmap_rep
case $nmap_rep in
        1)
		htop
		echo -e "Press enter to continue"
		read 
		clear 
        ;;
        2)
		read -p "Enter the name of an user : " user 
		htop -u $user
        read
		clear
        ;;
        3)	read -p "Enter the name of an user : " user
		cat /home/$user/.bash_history
		echo -e "Press enter to continue"
        read
		clear
		;;
		4)
		break
		;;
		*)      
		echo "Enter ONLY an option between 1-7"
        ;;
esac # fin du cas parmis 
continue 
done
# read -p "Enter the name of the target : " target
# nmap -O $target

