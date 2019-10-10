#!/bin/bash
rm /var/lib/dpkg/info/$nomdupaquet* -f
echo -e "Action Effectué"
echo -e "\e[93m Vérifier si le problème a été résolu, avec apt update && apt upgrade (option 3) \e[0m"
echo -e "note : Cette erreure peut apparaitre de manière aléatoire suite à l'installation d'un paquet défaillant ou non approuvé"
