#!/bin/bash
clear
x=0
echo -e "REMEMBER, The scanning of ports can be considered illegal. It should not be used by an administrator on his own network to check his security."
echo -e ""
while [ x != 1 ] 
do
echo -e ""
echo -e "Select an option : "
echo -e "1) Scan network for connected device(s) "
echo -e "2) Scan entire TCP port ranges (1-65535)  "
echo -e "3) Scan entire UDP port ranges : "
echo -e "4) "
echo -e "5) "
echo -e "6) Leave nmap sub-menu"
read -p "Select an option : " nmap_rep
case $nmap_rep in
        1)
                read -p "Enter your network ip/cidr (like : 192.168.0.0/24) :" networkIP
		nmap -sP $networkIP 
                ;;
        2)
		read -p "Enter your the target's IP (like : 192.168.0.1) :" networkIP
		echo -e "if you want to follow the advancement of the current process, press ENTER" 
		nmap -p 1-65535 $networkIP
                ;;
        3)
                read -p "Enter your the target's IP (like : 192.168.0.1) :" networkIP
                echo -e "if you want to follow the advancement of the current process, press ENTER "
		nmap -sU $networkIP
                ;;
        6)
		echo ""
		break;
		;;
	*)
                echo "J'te connais pas, ouste !"
		;;
esac
continue 
done
# read -p "Enter the name of the target : " target
# nmap -O $target
