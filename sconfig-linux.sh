#!/bin/bash
#-----------------------------------------------------------------------#
# a executer en root / you need to execute the pgm as root              #
# a internet connexion is required #
# you need to install curl and htop                                     #
# only executable on DEBIAN / ubuntu kernel environnement               #
#-----------------------------------------------------------------------#
echo "------------------------------------------------------------------"
echo "| scl - sconfig Linux  -  Brlndtech 2019 © AIO management Script |";  
echo "------------------------------------------------------------------";
read -p "Lancer le programme sconfig Linux  ? (O/N) : " rep
while [ $rep == "O" ] || [ $rep == "o" ]
do
# Déclaration des variables global : 
siroot=`whoami` # stock le resultat de la commande whoami dans usercheck
usercheck="root"
choix=99
ip=`ip -o -f inet addr show | awk '/scope global/ {print $4}' | head -1`
hostname=`hostname -s`
dnsdname=`hostname -d`
dns1=`cat /etc/resolv.conf | grep -m 1 'nameserver' | cut -c12-`
dns2=`cat /etc/resolv.conf | tail -1 | cut -c12-`
hdd=`df -h /dev/sda1 --output=fstype,size,used,avail,pcent`
# echo $usercheck;
if [ $siroot = $usercheck ]; then
#  su - 
   echo -e "*-------------------------------------------------------------------------------------------------------*"
   echo -e "*  0)  !Installer programme de base                  6)  Modifier le mdp d'un utilisateur               *"
   echo -e "*  1)  Message de bienvenue                          7)  Supprimer un utilisateur et son dossier        *"
   echo -e "*  2)  Afficher la météo                             8)  Lancer l'utilitaire HTOP                       *"
   echo -e "*  3)  Mise à jour des dépots                        9)  Sauvegarder un répertoire                      *"
   echo -e "*  4)  Nettoyage des paquets / dépots                10) Résoudre pb de dpkg suite à une cmd apt update *"
   echo -e "*  5)  Ajouter un utilisateur                        11) Résoudre pb E: Sub-process /usr/bin/dpkg       *"
   echo -e "*                                                                                                       *"
   echo -e "*  29) MAJ de l'OS (pour Debian9->10/Ubuntu (Not-LTS)                                                    *"
   echo -e "*  30) Quitter le programme                                                                             *"   
   echo -e "*-------------------------------------------------------------------------------------------------------*"
   read -p "Choisir parmis les options 0-30 : " choix
   case $choix in
         0)
         echo -e "\e[32m Vérifier que vous disposez des paquets : curl / htop ?  \e[0m";
         read -p "rep : (O/N) : " rep1
         if [ $rep1 == "O" ] || [ $rep1 == "o" ]; then
              apt-get install curl htop sudo
              echo -e "\e[92m  Votre système à installé le dépot curl et htop. Le programme début de journée, va pouvoir fonctionner de manière éfficient \e[0m "
         else 
              echo -e " \e[91m Vous avez annulé la vérification des paquets, en espérant que votre système contient bien : curl, htop.\e[0m"
         fi
         ;;
         1)
	 ./src/monit-linux-date.sh
         ;;
         2)
           echo -e "\e[93m"
           echo -e "Affichage de la météo en cours ... "
           echo -e "\e[0m" 
               curl -s wttr.in/?1 # you need to install curl / vous devez installer curl 
         ;;
         3)
           echo -e "\e[93m"
           echo -e "Mis à jours en cours ... "
           echo -e "\e[0m"
               apt update && apt upgrade
         ;;
         4)
          echo -e "\e[93m"
          echo -e "Nettoyage du système en cours ... "
          echo -e "\e[0m"
             apt-get autoremove
             apt-get clean
             apt-get purge
         ;;
         5) # ajout d'un utilisateur 
          echo -e "\e[93m "
          echo -e "En cours ... "
          echo -e "\e[0m"
               read -p "Entrer le nom de l'utilisateur à ajouter : " user  
               /usr/sbin/adduser --force-badname $user
          echo -e " \e[92m L'utilisateur $user a bien été crée et ajouté. Dossier personnel : /home/$user \e[0m"
         ;;
         6) # changer le mdp d'un utilisateur 
          echo -e "\e[93m " 
          echo -e  "en cours ... "
          echo -e "\e[0m";
               read -p "Entrer le nom de l'utilisateur dont vous voulez changer le mdp : " user  
               passwd $user
          echo -e " \e[92m Le mot de passe de l'utilisateur $user a bien été changé  \e[0m"
         ;;
         7) # supprimer un utilisateur
          echo -e "\e[93m "
          echo -e "En cours ... "
          echo -e "\e[0m";
               read -p "Entrer le nom de l'utilisateur à SUPPRIMER : " user  
               /usr/sbin/deluser $user
               rm -r /home/$user
          echo -e " \e[92m L'utilisateur $user a bien été supprimé, ainsi que son dossier personnel /home/$user. \e[0m"
         ;;
         8)
          echo -e "\e[93m"
          echo -e "Lancement de l'utilitaire HTOP ... " 
          echo -e "\e[0m" 
          htop
          ;;
         9)
          read -p "Entrer le chemin relatif ou absolue : " target  
          echo -e  "\e[33m Sauvegarde en cours ... \e[0m";
          cp -r $target /backup
          echo -e "\e[92m Action éfféctuée. -> Dossier sauvegardé. Pour le visualiser : cd /backup$target \e[0m";
         ;;
         10)
          rm -f /var/lib/dpkg/lock
          echo -e "\e[93m Vérifier si le problème a été résolu, avec apt update && apt upgrade (option 3) echo -e \e[0m"
          echo -e " note : Cette erreure peut apparaitre de manière aléatoire suite à l'installation d'un paquet défaillant ou non approuvé"
         ;;
         11)
          rm /var/lib/dpkg/info/$nomdupaquet* -f
          echo -e "\e[93m Vérifier si le problème a été résolu, avec apt update && apt upgrade (option 3) echo -e \e[0m"
          echo -e "note : Cette erreure peut apparaitre de manière aléatoire suite à l'installation d'un paquet défaillant ou non approuvé"
         ;;
	 12)
	 ./src/monit-linux-users.sh
         ;;
         13)
         ./src/monit-linux-info-sys.sh
         ;; 
         29)
         ./src/monit-linux-dist-upgrade.sh
         ;;
         30)
          echo -e " \e[92m  Vous avez mis fin du programme. à bientôt :) \e[0m "
          break;
         ;;
         99) # mode debug 
          read -p "Relancer le programme ? (O/N) : " rep
         ;;
         *)
          echo -e " \e[91m - Action non reconnu par le programme, saisissez un choix entre 1 et x \e[0m"
         ;;
      esac
      continue 
else 
   echo -e " \e[91m - ||| Impossible d'éxécuter le script dans ces conditions ||| - \e[0m";
   exit; 
fi
done # fin de la boucle
