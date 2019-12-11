#!/bin/bash
clear
daate=`date +%w`
daaate=`date +%A`
  if [ $daate == "1" ]; then # change to monday for english speackers
     echo -e "\e[96m Hey :)  Hey, let's take a coffe :) We are monday. `date +%d/%m/%Y` \e[0m";
  elif [ $daate == "5" ]; then # change to friday for english speackers
     echo -e "\e[96m Hey :)  Come on, few hours left before the week-end. We are friday. `date +%d/%m/%Y` \e[0m ";
  else 
     echo -e "\e[96m Hey :) Good morning, have a good day :) we are $daaate `date +%d/%m/%Y` ! \e[0m";
  fi
echo -e "Press enter to continue"
read

