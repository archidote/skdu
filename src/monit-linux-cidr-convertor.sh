#!/bin/bash
clear
startt="O"
echo -e "CIDR Convertor "
while [ $startt = 'O' ] || [ $startt = 'o' ]
do
  read -p "Entrer un /CIDR 1-32 : " cidr
  cidr=${cidr:-0}
  if [ $cidr -gt 0 ] && [ $cidr -le 8 ]; then 
    # let " xposant= 32 - $cidr "
    let " res = 2 ** cidr "
    let " pas = 256 / $res "
    let " netmask = 256 - $pas "
    let " wildcard = $pas - 1 "
    echo -e "/$cidr en décimal pointé = $netmask.0.0.0"
    echo -e "wildcard mask = $wildcard.255.255.255"
    read -p "Saisir un autre masque ? (O/n) : " startt
    startt=${startt:-O}
    clear
  elif [ $cidr -gt 8 ] && [ $cidr -le 16 ]; then 
    # let " xposant= 32 - $cidr "
    let " exposant = $cidr - 8  "
    let " res = 2 ** exposant "
    let " pas = 256 / $res "
    let " dernier = $pas - 1"
    let " netmask = 256 - $pas "
    let " wildcard = $pas - 1 "
    echo -e "/$cidr en décimal pointé = 255.$netmask.0.0"
    echo -e "wildcard mask = 0.$wildcard.255.255"
    read -p "Saisir un autre masque ? (O/n) : " startt
    startt=${startt:-O}
    clear
  elif [ $cidr -gt 16 ] && [ $cidr -le 24 ]; then 
    let " exposant = $cidr - 16  "
    let " res = 2 ** exposant "
    let " pas = 256 / $res "
    let " dernier = $pas - 1"
    let " netmask = 256 - $pas "
    let " wildcard = $pas - 1 "
    echo 
    echo -e "/$cidr en décimal pointé = 255.255.$netmask.0"
    echo -e "wildcard mask = 0.0.$wildcard.255"
    read -p "Saisir un autre masque ? (O/n) : " startt
    startt=${startt:-O}
    clear
  elif [ $cidr -gt 24 ] && [ $cidr -le 32 ]; then
    let " exposant = $cidr - 24  "
    let " res = 2 ** exposant "
    let " pas = 256 / $res "
    let " dernier = $pas - 1"
    let " netmask = 256 - $pas "
    let " wildcard = $pas - 1 "
    echo -e "/$cidr en décimal pointé = 255.255.255.$netmask"
    echo -e "wildcard mask = 0.0.0.$wildcard"
    read -p "Saisir un autre masque CIDR ? (O/n) : " startt
    startt=${startt:-O}
    clear
  else 
    echo -e " Masque incorect ! (1-32) "
  fi
done 
