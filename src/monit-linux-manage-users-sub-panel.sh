#!/bin/bash
clear
x=0
echo -e ""
echo -e " - Sub menu for manager user credentials - "
echo -e ""
while [ x != 1 ] 
do
clear
echo -e ""  
echo -e "  1) credentials info about an user "
echo -e "  2) add a user"
echo -e "  3) del an user "
echo -e "  4) Change password of an user"
echo -e "  5) Add a alias to a bashrc user"
echo -e "  6) "
echo -e "  7) Leave this sub-menu"
read -p "Select an option : " nmap_rep
case $nmap_rep in
        1)
		read -p "Enter the name of an user : " name
		echo "" 
		echo ""  
		chage -l $name 
		echo "" 
		echo "" 
        ;;
        2)
		clear
		read -p "Entrer le nom de l'utilisateur à ajouter : " user  
		/usr/sbin/adduser --force-badname $user
		echo -e " \e[92m L'utilisateur $user a bien été crée et ajouté. Dossier personnel : /home/$user \e[0m"
		echo -e "Press enter to continue"
		read 
		clear 
		;;
        3)
		clear
		echo -e "\e[93m "
		echo -e "En cours ... "
		echo -e "\e[0m";
		read -p "Entrer le nom de l'utilisateur à SUPPRIMER : " user  
		/usr/sbin/deluser $user
		rm -r /home/$user
		echo -e " \e[92m L'utilisateur $user a bien été supprimé, ainsi que son dossier personnel /home/$user. \e[0m"
        echo -e "Press enter to continue"
		read 
		clear 
        ;;
		4)
		clear
		echo -e "\e[93m"
		echo -e  "en cours ... "
		echo -e "\e[0m";
		read -p "Entrer le nom de l'utilisateur dont vous voulez changer le mdp : " user  
		passwd $user
		echo -e " \e[92m Le mot de passe de l'utilisateur $user a bien été changé  \e[0m"
		;;
		5)
		clear
		read -p "Entrer name of the user, to add an alias to his profile (ex cmd uu = apt update && apt upgrade) : " user
		# if [ $cuser == "root" ]; then 
		# else 
		read -p "Enter the name of the alias (like uu) : " alias
		read -p "Enter the command who will bind into the alias : " cmd
		chmod 755 /home/$user/.bashrc
		echo -e " \n # alias added by skdu \n alias $alias='$cmd'" >> /home/$user/.bashrc
		source /home/$user/.bashrc
		chmod 644 /home/$user/.bashrc
		# fi 
		echo -e " the alias $alias has been add to your .bashrc (permanently) !"
		echo -e "Press enter to continue"
                read
		;;
        6)
		;;
		7)
		break
		;;
		*)      
		echo "Enter ONLY an option between 1-7"
        ;;
esac
continue # on continue la boucle tt quand on quite pas
done # fin de la boucle 
# read -p "Enter the name of the target : " target
# nmap -O $target
