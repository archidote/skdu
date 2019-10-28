#!/bin/bash
startt="O"
while [ $startt = 'O' ] || [ $startt = 'o' ]
do
  read -p "Entrer un /CIDR 1-32 : " cidr
  clear
  if [ $cidr -gt 0 ] && [ $cidr -le 8 ]; then 
    # let " xposant= 32 - $cidr "
    let " res = 2 ** cidr "
    let " premask = 256 / $res "
    let " netmask = 256 - $premask "
    let " wildcard = $premask - 1 "
    echo -e "/$cidr en décimal pointé = $netmask.0.0.0"
    echo -e "wildcard mask = $wildcard.255.255.255"
    read -p "Saisir un autre masque ? (O/N) : " startt
    clear
  elif [ $cidr -gt 8 ] && [ $cidr -le 16 ]; then 
    # let " xposant= 32 - $cidr "
    let " exposant = $cidr - 8  "
    let " res = 2 ** exposant "
    let " premask = 256 / $res "
    let " netmask = 256 - $premask "
    let " wildcard = $premask - 1 "
    echo -e "/$cidr en décimal pointé = 255.$netmask.0.0"
    echo -e "wildcard mask = 0.$wildcard.255.255"
    read -p "Saisir un autre masque ? (O/N) : " startt
    clear
  elif [ $cidr -gt 16 ] && [ $cidr -le 24 ]; then 
    # let " xposant= 32 - $cidr "
    let " exposant = $cidr - 16  "
    let " res = 2 ** exposant "
    let " premask = 256 / $res "
    let " netmask = 256 - $premask "
    let " wildcard = $premask - 1 "
    echo -e "/$cidr en décimal pointé = 255.255.$netmask.0"
    echo -e "wildcard mask = 0.0.$wildcard.255"
    read -p "Saisir un autre masque ? (O/N) : " startt
    clear
  elif [ $cidr -gt 24 ] && [ $cidr -le 32 ]; then 
    # let " xposant= 32 - $cidr "
    let " exposant = $cidr - 24  "
    let " res = 2 ** exposant "
    let " premask = 256 / $res "
    let " netmask = 256 - $premask "
    let " wildcard = $premask - 1 "
    echo -e "/$cidr en décimal pointé = 255.255.255.$netmask"
    echo -e "wildcard mask = 0.0.0.$wildcard"
    read -p "Saisir un autre masque ? (O/N) : " startt
    clear
  else 
    echo -e "Masque incorect !"
  fi
done 