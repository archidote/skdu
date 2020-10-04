#!/bin/bash
clear
echo -e "The weather is loading ... (depending of your internet connexion)"
sleep 2
curl -s wttr.in/?1 # you need to install curl / vous devez installer curl
echo -e " Press enter to continue " 
read
clear
