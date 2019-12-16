#!/bin/bash
clear
x=0
echo -e " \e[91m REMEMBER \e[0m , The scanning of ports can be considered illegal. It should not be used by an administrator on his own network to check his security."
echo -e "**************************************************"
echo -e "| - Sub menu for do some pentest into a network - |"
echo -e "**************************************************"
while [ x != 1 ] 
do
echo -e ""
echo -e "  1) Scan network for connected device(s) "
echo -e "  2) Scan entire TCP port ranges (1-65535)  "
echo -e "  3) Scan entire UDP port ranges : "
echo -e "  4) Brute force SSH attaque (only port on 22)"
echo -e "  5) Check potential vulnerabilities of your system"
echo -e "  6) Slowloris pentest against a target"
echo -e "  7) Leave nmap sub-menu"
echo -e ""
read -p "Select an option : " nmap_rep
case $nmap_rep in
        1)
        read -p "Enter your network ip/cidr (like : 192.168.0.0/24) : " networkIP
		echo -e "If you want to follow the advancement of the current process, press ENTER" 
		nmap -sP $networkIP
		echo -e "Press enter to continue"
		read 
		clear 
                ;;
        2)
		read -p "Enter your the target's IP (like : 192.168.0.1) : " networkIP
		echo -e "If you want to follow the advancement of the current process, press ENTER" 
		nmap -p 1-65535 $networkIP
		echo -e "Press enter to continue"
                read
		clear
                ;;
        3)
        read -p "Enter your the target's IP (like : 192.168.0.1) : " networkIP
        echo -e "if you want to follow the advancement of the current process, press ENTER "
		nmap -sU $networkIP
		echo -e "Press enter to continue"
        read
		clear
        ;;
	4)
		read -p "Enter your the target's IP (like : 192.168.0.1) : " networkIP
		read -p "Enter the time (in seconds ex : 3600 for 1H : " time 
		echo -e "If you want to follow the advancement of the current process, press ENTER "
		nmap --script=ssh-brute.nse --script-args unpwdb.timelimit=$time $networkIP
		# nmap -p 22 --script ssh-brute --script-args userdb=usernames.lst,passdb=passwords.lst 192.168.40.199
		echo -e  " Press enter to continue "
		read
		;;
	5)
		read -p "Enter your the target's IP (like : 192.168.0.1) : " networkIP
		echo -e "If you want to follow the advancement of the current process, press ENTER "
		nmap -v --script vuln $networkIP
		echo -e  " Press enter to continue "
        read
		;;
        6)
		read -p "Enter your the target's IP (like : 192.168.0.1) : " networkIP
        echo -e "If you want to follow the advancement of the current process, press ENTER "
        nmap -p 80,443 --max-parallelism 750 -Pn --script http-slowloris $networkIP
        echo -e  " Press enter to continue "
        read
		;;
		7)
		clear
		break
		;;
		*)
		clear
		echo -e "\e[91m Enter ONLY an option between 1-7 \e[0m"
        ;;
esac
continue 
done
# read -p "Enter the name of the target : " target
# nmap -O $target
