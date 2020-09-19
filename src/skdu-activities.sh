#!/bin/bash
clear
x=0
echo -e "***********************************************************"
echo -e "| - Sub menu for follow the activities (general / user) - |"
echo -e "***********************************************************"
while [ x != 1 ] 
do
echo -e ""
echo -e "  1) Follow the general activities of the OS"
echo -e "  2) Follow the activities of an user "
echo -e "  4) Leave the sub-menu"
echo -e "" 
read -p "Select an option : " nmap_rep
case $nmap_rep in
        1)
		htop
		clear 
        ;;
        2)
		clear
		while [ x != 1 ]
			do
			read -p "Enter the name of an user (expect root at this moment, next update for sure :) : " user
			if [ $user == "root" ]; then 
				htop -u $user
	        	break
			elif [ $(id -u $user) != "root" ]; then
				htop -u $user
	            break
			else 
				echo -e "  \e[91m - Error us001 -> unknow user !!!  \e[0m -"
				continue
			fi
	    done
	    clear
		;;
		4)
		clear
		break
		;;
		*)
		clear
		echo -e " \e[91m  Enter ONLY an option between 1-4 \e[0m "
        ;;
esac
continue 
done
