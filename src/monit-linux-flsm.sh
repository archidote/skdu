#!/bin/bash
clear
echo -e "\n CIDR / Subnetting FLSM | by brlndtech "
tput cup 2 1
echo [
tput cup 2 38
echo ]
i=2
while [ $i -ne 38 ] ; do
    tput cup 2 $i
    echo -e "=>\c"
    i=$(($i + 1))
    sleep 0.01
done
echo -e "\n Loading = OK "
sleep 1
startt="O"
clear
while [ $startt = 'O' ] || [ $startt = 'o' ]
do
  read -p "Entrer un /CIDR 1-32 : " cidr
  cidr=${cidr:-0}
  if [ $cidr -gt 0 ] && [ $cidr -lt 8 ]; then 
    # let " xposant= 32 - $cidr "
    let " res = 2 ** cidr "
    let " pas = 256 / $res "
    let " netmask = 256 - $pas "
    let " wildcard = $pas - 1 "
    echo -e "/$cidr in decimal = $netmask.0.0.0"
    echo -e "wildcard mask = $wildcard.255.255.255"
    read -p "Grab an other mask ? (O/n) : " startt
    startt=${startt:-O}
    clear
  elif [ $cidr -ge 8 ] && [ $cidr -lt 16 ]; then 
    # let " xposant= 32 - $cidr "
    read -p "Entrer une @ ipv4 : " ipv4
    ipv4=${ipv4:-10.0.0.0}
    ip_1octet=`echo $ipv4 | cut -f1 -d.`
    ip_cut="$ip_1octet.0.0.0"
    let " exposant = $cidr - 8  "
    let " res = 2 ** exposant "
    let " pas = 256 / $res "
    let " dernier = pas - 1"
    let " netmask = 256 - $pas "
    let " wildcard = $pas - 1 "
    echo
    echo -e "$ip_cut/$cidr"
    echo
      for ((i = 0 ; i <= 255; i += $pas))
      do
        echo -e "Res @ : $ip_1octet.$i.0.0"
      done
      echo
      for ((i = 0 ; i <= 255; i += $pas))
      do
        echo -e "1er @ : $ip_1octet.$i.0.1"
      done
      echo
      for ((j = $dernier ; j <= 256; j += $pas))
      do
        echo -e "Der @ : $ip_1octet.$j.255.254"
      done
      echo
      for ((j = $dernier ; j <= 256; j += $pas))
      do
        echo -e "Broadcast @ : : $ip_1octet.$j.255.255"
      done 
      echo
    echo -e "/$cidr in decimal = 255.$netmask.0.0"
    echo -e "wildcard mask = 0.$wildcard.255.255"
    echo
    read -p "Grab an other mask ? (O/n) : " startt
    startt=${startt:-O}
    clear
  elif [ $cidr -ge 16 ] && [ $cidr -lt 24 ]; then 
    # let " xposant= 32 - $cidr "
    read -p "Enter an @ ipv4 : " ipv4
    ipv4=${ipv4:-172.16.0.0}
    ip_1octet=`echo $ipv4 | cut -f1 -d.`
    ip_2octet=`echo $ipv4 | cut -f2 -d.`
    ip_cut="$ip_1octet.$ip_2octet.0.0"
    let " exposant = $cidr - 16  "
    let " res = 2 ** exposant "
    let " pas = 256 / $res "
    let " dernier = pas - 1"
    let " netmask = 256 - $pas "
    let " wildcard = $pas - 1 "
    echo
    echo -e "$ip_cut/$cidr"
    echo
      for ((i = 0 ; i <= 255; i += $pas))
      do
        echo -e "Res @ : $ip_1octet.$ip_2octet.$i.0"
      done
      echo
      for ((i = 0 ; i <= 255; i += $pas))
      do
        echo -e "1er @ : $ip_1octet.$ip_2octet.$i.1"
      done
      echo
      for ((j = $dernier ; j <= 256; j += $pas))
      do
        echo -e "Der @ : $ip_1octet.$ip_2octet.$j.254"
      done
      echo
      for ((j = $dernier ; j <= 256; j += $pas))
      do
        echo -e "Broadcast @ :  $ip_1octet.$ip_2octet.$j.255"
      done 
    echo
    echo -e "/$cidr in decimal = 255.255.$netmask.0"
    echo -e "wildcard mask = 0.0.$wildcard.255"
    echo
    read -p "Grab an other mask ? (O/n) : " startt
    startt=${startt:-O}
    clear
  elif [ $cidr -ge 24 ] && [ $cidr -lt 32 ]; then
    read -p "Entrer une @ ipv4 : " ipv4
    ipv4=${ipv4:-192.168.1.0}
    ip_1octet=`echo $ipv4 | cut -f1 -d.`
    ip_2octet=`echo $ipv4 | cut -f2 -d.`
    ip_3octet=`echo $ipv4 | cut -f3 -d.`
    ip_cut="$ip_1octet.$ip_2octet.$ip_3octet.0"
    # let " xposant= 32 - $cidr "
    let " exposant = $cidr - 24  "
    let " res = 2 ** exposant "
    let " pas = 256 / $res "
    let " dernier = pas - 1"
    let " netmask = 256 - $pas "
    let " wildcard = $pas - 1 "
    echo
    echo -e "$ip_cut/$cidr"
    echo
      for ((i = 0 ; i <= 255; i += $pas))
      do
        echo -e "Res @ : $ip_1octet.$ip_2octet.$ip_3octet.$i"
      done
      echo
      for ((i = 0 ; i <= 255; i += $pas))
      do
        let " un = i + 1"
        echo -e "1er @ : $ip_1octet.$ip_2octet.$ip_3octet.$un"
      done
      echo
      for ((j = $dernier - 1 ; j <= 256; j += $pas))
      do
        echo -e "Der @ : $ip_1octet.$ip_2octet.$ip_3octet.$j"
      done
      echo
      for ((j = $dernier ; j <= 256; j += $pas))
      do
        echo -e "Broadcast @ :  $ip_1octet.$ip_2octet.$ip_3octet.$j"
      done
    echo
    echo -e "/$cidr in decimal = 255.255.255.$netmask"
    echo -e "wildcard mask = 0.0.0.$wildcard"
    echo
    read -p "Grab an other mask (O/n) : " startt
    startt=${startt:-O}
    clear
  else 
    echo -e " Incorrect mask ! (1-32) "
  fi
done
# echo "A+"
