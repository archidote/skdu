#!/bin/bash
echo -e "Voulez vous installer les paquets suivants : htop / curl / sudo / nmap / net-tools ? (permet au programme de fonctionner de manière éfficiente) : (O/N)"
read -p "" rep1
    if [ $rep1 == "O" ] || [ $rep1 == "o" ]; then
       apt-get install curl htop sudo nmap netplan
       echo -e "\e[92m  Votre système à installé le dépot curl / htop / sudo / nmap . Le programme sconfig-linux, va pouvoir fonctionner de manière éfficient \e[0m "
    else 
       echo -e " \e[91m Vous avez annulé la vérification des paquets, en espérant que votre système contient bien : curl, htop.\e[0m"
    fi

