#!/bin/bash 
echo -e "Détection automatique de l'OS en cours ... "
   if [ "`cat /etc/issue | cut -c1-6`" == "Ubuntu" ]; then
      echo -e "Votre système dexploitation est reconnu comme étant  \e[92m Ubuntu. \e[0m"
      read -p "Voulez vous mettre à jour votre Système d'exploitation Ubuntu ? (O/N) " rep1
      echo -e "note : la mise à jour d'ubuntu LTS n'est pas supportée par le porgramme, sorry  ! "
      read -p "Attention, cette action ne peut pas être stoppé. Une dernière fois ETES VOUS SUR ? (O/N) " rep1
      if [ $rep1 == "O" ] || [ $rep1 == "o" ]; then
          sudo apt update && apt upgrade
          sudo apt-get install do-release-upgrade
          sudo do-release-upgrade
          echo -e " \e[92m  Votre système Ubuntu est à jours ! \e[0m "
      else 
         echo " \e[93m Vous avez annulé la mise à jour de ubuntu \e[0m "
      fi
    elif [ "`cat /etc/issue | cut -c1-6`" == "Debian" ]; then
      echo -e "Votre système dexploitation est reconnu comme étant \e[92m Debian. (ATTENTION l'option mis à jours est seulement disponnible pr debian 9)"
      read -p "Voulez vous mettre à jour votre Système d'exploitation Debian ? (O/N) " rep1
      read -p "Attention, cette action ne peut pas être stoppé. Une dernière fois ETES VOUS SUR ? (O/N)" rep1
      if [ $rep1 == "O" ] || [ $rep1 == "o" ]; then
           sed -i 's/stretch/buster/g' /etc/apt/sources.list # ajout du dépot pour pemettre de down la maj 
           apt-get update && apt-get upgrade && apt-get dist-upgrade # déclemenchement du processus de la MAJ.
           echo -e "\e[92m  Votre système debian est à jour ! \e[0m "
      else
           echo -e "\e[93m Vous avez annulé la mise à jour de de Debian. \e[0m"
      fi
    else
           echo -e "\e[91m Votre distribution n'est pas supporté par le porgramme concernant la maj du système\e[0m"
    fi
