#!/bin/bash
clear
x=0
echo -e "*********************************************"
echo -e "* - Sub menu for manager user credentials - *"
echo -e "*********************************************"
while [ x != 1 ] 
do
echo -e ""  
echo -e "  1) Credentials info about an user "
echo -e "  2) Add a user"
echo -e "  3) Del an user "
echo -e "  4) Change password of an user"
echo -e "  5) Add a alias to a bashrc user"
echo -e "  6) List all the users "
echo -e "  7) Lock an account (with a special date)"
echo -e "  8) Leave this sub-menu"
read -p "Select an option : " nmap_rep
case $nmap_rep in
        1)
		read -p "Enter the name of an user : " name
		echo "" 
		echo ""  
		chage -l $name 
		echo "" 
		echo "Press enter to continue"
		read 
        ;;
        2)
		clear
		read -p "Enter the new user (name...)  : " user  
		/usr/sbin/adduser --force-badname $user
		echo -e " \e[92m The user $user has been created. Personnal folder location : /home/$user \e[0m"
		echo -e "Press enter to continue"
		read 
		clear 
		;;
        3)
		clear
		read -p "Enter the name of the user to deleted him : " user  
		/usr/sbin/deluser $user
		rm -r /home/$user
		echo -e " \e[92m The user $user has been removed, as well as his personal folder /home/$user. \e[0m"
        echo -e "Press enter to continue"
		read 
		clear 
        ;;
		4)
		clear
		echo -e "\e[93m"
		echo -e  "en cours ... "
		echo -e "\e[0m";
		read -p "Enter the name of the user for changing his password : " user  
		passwd $user
		echo -e " \e[92m The password of $user has been changed !  \e[0m"
		;;
		5)
		clear
		while [ x != 1 ]
		do
			read -p "Entrer name of the user, to add an alias to his profile (ex : root) : " user
			if [ $user == "root" ]; then 
				read -p "Enter the name of the alias (like uu) : " alias
				read -p "Enter the command who will bind into the alias (ex : apt update && apt upgrade) : " cmd
				chmod 755 /root/.bashrc
				echo -e " \n# alias added by skdu \nalias $alias='$cmd'" >> /root/.bashrc
				chmod 644 /root/.bashrc
				source /root/.bashrc
				# WARNING source /root/.bashrc is not enought to reload the root shell, so in the main program, I have had (at the end) exec bash.
				# exec bash reload completly the root's shell (and .bashrc), so the alias will work succefully 
				echo -e "The alias $alias has been add to your .bashrc for the $user user (permanently) !"
				echo -e "Press enter to continue"
	        	read
	        	break
			elif [ $(id -u $user) != "root" ]; then
				read -p "Enter the name of the alias (ex :  md) : " alias
				read -p "Enter the command who will bind into the alias (ex : mkdir) : " cmd
				chmod 755 /home/$user/.bashrc
				echo -e " \n# alias added by skdu \nalias $alias='$cmd'" >> /home/$user/.bashrc
				source /home/$user/.bashrc
				chmod 644 /home/$user/.bashrc
				echo -e "The alias $alias has been add to the .bashrc file for the $user user (permanently) !"
			    echo -e "Press enter to continue"
	            read
	            break
			else 
				echo -e "  \e[91m - Error us001 -> unknow user !!!  \e[0m -"
				continue
			fi
		done
		clear
		;;
        6)
		clear
		grep bash /etc/passwd | cut -f1 -d:
		#-d veut dire on coupe la ligne juste avant les : 
		echo -e "Press enter to continue"
		read
		;;
		7)
		read -p "Enter the name of an user for lock his account : " name
		read -p "Enter the day (1) : " day
		read -p "Enter the month (12) : " month 
		read -p "Enter the year (2019) : " year
		echo ""  
		chage -E $year-$month-$day $name
		echo "" 
		echo "Press enter to continue"
		read
		;;
		8)
		break
		;;
		*)
		clear    
		echo -e " \e[91m Enter ONLY an option between 1-8 \e[0m"
        ;;
esac
continue # on continue la boucle tt quand on quite pas
done # fin de la boucle
clear
# read -p "Enter the name of the target : " target
# nmap -O $target
