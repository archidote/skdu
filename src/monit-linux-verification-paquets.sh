#!/bin/bash
clear
read -p "Do you want to install  htop / curl / sudo / nmap / net-tools ? (Allow the programme to function effectively) : (O/N)" rep1
    if [ $rep1 == "O" ] || [ $rep1 == "o" ]; then
       apt-get install curl htop sudo nmap net-tools zip unzip
       echo -e "\e[92m  Your machine have installed (or updated) curl / htop / sudo / nmap / net-tools / zip / unzip  . Sconfig-linux will work more effectively \e[0m "
    else 
       echo -e " \e[91m You have canceled the packets checks.  I hope that your system have : htop / curl / sudo / nmap / net-tools \e[0m"
    fi
