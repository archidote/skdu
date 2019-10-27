#!/bin/bash
clear
echo "------------------------------------------------------------------"
echo "| scl - sconfig Linux  -  Brlndtech 2019 © AIO management Script |";  
echo "------------------------------------------------------------------";
read -p "Start the sconfig Linux programme ? (O/N) : " rep
while [ $rep == "O" ] || [ $rep == "o" ]
do
# Déclaration des variables global : 
siroot=`whoami` # stock le resultat de la commande whoami dans usercheck
usercheck="root"
choix=99
# fin des var global 
if [ $siroot = $usercheck ]; then
#  su - 
   echo -e "*-------------------------------------------------------------------------------------------------------*"
   echo -e "*  0)  !Installer programme de base                   6)  Change the password of an user                *"
   echo -e "*  1)  Welcome message                                7)  Delete an user and his /home/user folder      *"
   echo -e "*  2)  Display the weather                            8)  HTOP                                          * "
   echo -e "*  3)  apt update && apt upgrade                      9)  Make a quick backup of a folder               *"
   echo -e "*  4)  apt autoremove && apt purge                    10) solve the dpkg error after the cmd apt update *"
   echo -e "*  5)  Add a new user                                 11) solve E: Sub-process /usr/bin/dpkg            *"
   echo -e "*                                                                                                       *"
   echo -e "*  12) Log ssh (failed or accepted password)          29) DIST UPGRADE (Deb 9->10/ Ubuntu (Not-LTS)     *" 
   echo -e "*  13) About your server                              30) Leave the pgm                                 *"    
   echo -e "*  14) Change your IP (main network interface)                                                          *"
   echo -e "*  15) change the hostname of the machine                                                               *"
   echo -e "*  16) Display all the users (real)                                                                     *"
   echo -e "*-------------------------------------------------------------------------------------------------------*"
   read -p "Make your choice between 0-30 : " choix
   case $choix in
         0)
         ./src/monit-linux-verification-paquets.sh
         ;;
         1)
         ./src/monit-linux-date.sh
         ;;
         2) 
         ./src/monit-linux-meteo.sh
         ;;
         3)
         ./src/monit-linux-maj-apt.sh
         ;;
         4)
	     ./src/monit-linux-autoremove-purge.sh
         ;;
         5) # ajout d'un utilisateur 
         ./src/monit-linux-adduser.sh
         ;;
         6) # changer le mdp d'un utilisateur 
         ./src/monit-linux-passwd.sh
         ;;
         7) # supprimer un utilisateur
         ./src/monit-linux-deluser.sh 
         ;;
         8) 
         htop
         ;;
         9)
         ./src/monit-linux-backup.sh
         ;;
         10)
         ./src/monit-linux-dpkgpb1.sh
         ;;
         11)
         ./src/monit-linux-dpkgpb2.sh
         ;;
	     12)
	     ./src/monit-linux-ssh-failed-logs.sh
         ;;
         13)
         ./src/monit-linux-info-sys.sh
         ;; 
         14)
      	 ./src/monit-linux-networking.sh
      	 ;;
         15)
         ./src/monit-linux-hostname.sh
         ;;
         16) 
         ./src/monit-linux-list-users.sh
         ;;
	 17)
	 ./src/monit-linux-nmap.sh
	 ;;
         29)
         ./src/monit-linux-dist-upgrade.sh
         ;;
         30)
         echo -e " \e[92m  You have leaved sconfig-linux. See you soon :) \e[0m "
         break;
         ;;
         99) # mode debug 
         read -p "Revive the programme ? " rep
         ;;
         *)
         echo -e " \e[91m - 001 - Unknow operation, please enter a number between 0 and 30 \e[0m"
         ;;
      esac
      continue 
else 
   echo -e " \e[91m - ||| Unable to execute sconfig-linux in these conditions : please follow the README.md, to solve the problem ||| - \e[0m";
   exit; 
fi
done # fin de la boucle
