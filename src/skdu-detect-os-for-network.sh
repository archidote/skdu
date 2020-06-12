#!/bin/bash
clear
echo -e "Performing OS Detection (...)"
if [ "`cat /etc/issue | cut -c1-6`" == "Ubuntu" ] || [ "`cat /etc/issue | cut -c1-13`" == "elementary OS" ]; then
    echo -e "\e[92m Distribution : ubuntu (like) \e[0m "
    ./src/skdu-ipfixe-netplan.sh # on précise le dossier src du projet de base
elif [ "`cat /etc/issue | cut -c1-6`" == "Debian" ]; then
    echo -e "\e[92m Distribution : Debian \e[0m "
    ./src/skdu-ip-debian.sh # on précise le dossier src du projet de base
elif [ "`cat /etc/issue | cut -c1-4`" == "Kali" ]; then
    echo -e "\e[92m Distribution : Kali \e[0m "
    ./src/skdu-ip-debian.sh # on précise le dossier src du projet de base
else 
    echo -e " \e[91m Your Distribution is not supported : sorry :( \e[0m"
    echo -e " nb : Compatible OS : Debian, Ubuntu, Elementary OS, Kali"
fi
