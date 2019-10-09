#!/bin/bash
echo -e "\e[93m"
echo -e "Nettoyage du système en cours ... "
echo -e "\e[0m"
apt-get autoremove
apt-get purge
echo -e " \e[92m Le système est de nouveau propre \e[0m "
