#!/bin/bash 
clear
echo -e "Performing an OS detection"
   if [ "`cat /etc/issue | cut -c1-6`" == "Ubuntu" ]; then
      echo -e "Your system appears to be  \e[92m Ubuntu. \e[0m"
      read -p "Do you want to update your ubuntu server (O/N) " rep1
      echo -e "Note : Ubuntu LTS is not supported, sorry  ! "
      read -p "Please note that this action cannot be stopped. Are you sure? (SURE)" rep1
      if [ $rep1 == "O" ] || [ $rep1 == "o" ]; then
          sudo apt update && apt upgrade
          sudo apt-get install do-release-upgrade
          sudo do-release-upgrade
          echo -e " \e[92m  You have succefully updated your ubuntu system ! ! \e[0m "
	  echo -e " Press enter to continue "
          read
      else 
         echo " \e[93m You have canceled your ubuntu dist-upgrade \e[0m "
      fi
    elif [ "`cat /etc/issue | cut -c1-6`" == "Debian" ]; then
      echo -e "Your system appears to be \e[92m Debian \e[0m. PLEASE NOTE the updated option is only available for debian 9 -> debian 10)"
      read -p "Do you want to update your Debian to the latest version ? (O/N) " rep1
      read -p "Please note that this action cannot be stopped. Are you sure? (SURE)" rep1
      if [ $rep1 == "O" ] || [ $rep1 == "o" ]; then
           sed -i 's/stretch/buster/g' /etc/apt/sources.list # ajout du dépot pour pemettre de down la maj 
           apt-get update && apt-get upgrade && apt-get dist-upgrade # déclemenchement du processus de la MAJ.
           echo -e "\e[92m  You have succefully updated your Debian system \e[0m "
	   echo -e " Press enter to continue "
	   read
      else
           echo -e "\e[93m You have canceled the debian dist-upgrade \e[0m"
      fi
    else
           echo -e "\e[91m Your distribution is not supported by the porgram concerning the dist-upgrade\e[0m"
    fi
