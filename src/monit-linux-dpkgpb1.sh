#!/bin/bash 
clear
rm -f /var/lib/dpkg/lock
echo -e "Action Effectué"
echo -e "\e[93m Vérifier si le problème a été résolu, avec apt update && apt upgrade (option 3) \e[0m"
echo -e " note : Cette erreure peut apparaitre de manière aléatoire suite à l'installation d'un paquet défaillant ou non approuvé"
