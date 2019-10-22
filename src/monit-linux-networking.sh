#!/bin/bash
echo -e "Détection automatique de l'OS en cours ... "
if [ "`cat /etc/issue | cut -c1-6`" == "Ubuntu" ] || [ "`cat /etc/issue | cut -c1-13`" == "elementary OS" ]; then
    echo -e "\e[92m Distribution : ubuntu (like) \e[0m "
    ./src/monit-linux-ipfixe-netplan.sh # on précise le dossier src du projet de base
elif [ "`cat /etc/issue | cut -c1-6`" == "Debian" ]; then
    echo -e "\e[92m Distribution : Debian \e[0m "
    ./src/monit-linux-ipfixe-debian.sh # on précise le dossier src du projet de base
else 
    echo -e " \e[91m Votre distribution n'est pas pris en charge, par cette option du programme : sorry :( \e[0m"
fi
