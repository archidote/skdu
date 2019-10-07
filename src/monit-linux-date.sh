#!/bin/bash
daate=`date +%A`
  if [ $daate == "lundi" ]; then # change to monday for english speackers
     echo -e "\e[96mHey :)  Va prendre un café : Nous sommes Lundi `date +%d/%m/%Y` \e[0m";
  elif [ $daate == "vendredi" ]; then # change to friday for english speackers
     echo -e "\e[96mHey :)  Aller plus que quelques heures avant le week-end. Nous sommes vendredi. `date +%d/%m/%Y` \e[0m ";
  else
     echo -e "\e[96mHey :)  Bonne journée, nous sommes le `date +%d/%m/%Y` ! \e[0m";
  fi

