#!/bin/bash
clear
read -p "Entrer le chemin relatif ou absolue : " target  
echo -e  "\e[33m Sauvegarde en cours ... \e[0m";
cp -r $target /backup
echo -e "\e[92m Action éfféctuée. -> Dossier sauvegardé. Pour le visualiser : cd /backup$target \e[0m";
