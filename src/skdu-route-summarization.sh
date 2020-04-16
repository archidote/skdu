#!/bin/bash
rep="O"
function log2 {
  local x=0
  for (( y=$1-1 ; $y > 0; y >>= 1 )) ;
  do
    let x=$x+1
  done
  echo $x
}
while [ $rep = 'O' ] || [ $rep = 'o' ]
do
  clear
  read -p "Enter an @ ipv4 ex 192.168.1.0 : " ipv4
  ipv4=${ipv4:-10.0.0.0} # control de saisie 
  read -p "Enter your \"base\" netmask (CIDR) : " cidr
  cidr=${cidr:-0} # control de saisie 
  if [ $cidr -ge 8 ] && [ $cidr -le 16 ]; then 
    ip_1octet=`echo $ipv4 | cut -f1 -d.`
    ip_2octet=`echo $ipv4 | cut -f2 -d.`
    ip_cut="$ip_1octet.$ip_2octet.0.0"
    let " pasExemple = 16 - $cidr "
    let " pasExemple = 2 ** $pasExemple"
    read -p "What is your step ? ($pasExemple seems to be the most suitable) : " pas
    read -p "How many subnet do you want ? (ex : 2) : " cmb_sr #4
    let " pasmax = cmb_sr * pas "
    j=1
    if [ $pasmax -ge 1 ] && [ $pasmax -le 256 ]; then
    let " pasmax = $pasmax + $ip_2octet "
    echo
      for ((i = $ip_2octet ; i < $pasmax ; i += $pas)) # < pour éviter de dépasser 256
      do
          echo -e "Res $j  @ : $ip_1octet.$i.0.0"
          j=$[$j +1]
      done
      x=`log2 $pasmax`
      let " newmaskCidr = 16 - $x "
      echo -e "\nNew mask for summarization : /$newmaskCidr \nSummarization network : $ip_cut/$newmaskCidr"
      let " exposant = $newmaskCidr - 8  "
      if [ $exposant -lt 0 ]; then 
        let " exposant = 2 "
        echo "We recommend that you review your addressing plan because it does not necessarily work in all cases"
      fi
      let " res = 2 ** $exposant "
      let " pas = 256 / $res "
      let " dernier = pas - 1"
      let " netmaskDecimal = 256 - $pas "
      let " wildcard = $pas - 1 "
      echo -e "-> /$newmaskCidr in dotted decimal = 255.$netmaskDecimal.0.0 \n-> Wildcard mask = 0.$wildcard.255.255"
      read -p "One more network ? (O/n) : " rep
      rep=${rep:-O}
    else
      read -p "The order of magnitude is not respected (> 256)!`echo $'\n->'` Try again ? (O/n): " rep
      rep=${rep:-O}
    fi
  elif [ $cidr -gt 16 ] && [ $cidr -le 24 ]; then 
    ip_1octet=`echo $ipv4 | cut -f1 -d.`
    ip_2octet=`echo $ipv4 | cut -f2 -d.`
    ip_3octet=`echo $ipv4 | cut -f3 -d.`
    ip_cut="$ip_1octet.$ip_2octet.$ip_3octet.0"
    let " pasExemple = 24 - $cidr "
    let " pasExemple = 2 ** $pasExemple"
    read -p "What is your step ? ($pasExemple seems to be the most suitable) : " pas
    read -p "How many subnet do you want ? (ex : 2) : " cmb_sr
    let " pasmax = cmb_sr * pas " # 4 * 1 = 4 
    j=1
    if [ $pasmax -ge 1 ] && [ $pasmax -le 256 ]; then
    let " pasmax = $pasmax + $ip_3octet " # 4 + 10 (ex valeur du 3e octet) = 14
    echo
      for ((i = $ip_3octet ; i < $pasmax ; i += $pas))
      do
          echo -e "Network $j   @ : $ip_1octet.$ip_2octet.$i.0"
          j=$[$j +1]
      done
      x=`log2 $pasmax`
      let " newmaskCidr = 24 - $x "
      echo -e "\nNew mask for summarization : /$newmaskCidr \nSummarization network : $ip_cut/$newmaskCidr"
      let " exposant = $newmaskCidr - 16  "
      if [ $exposant -lt 0 ]; then 
        let " exposant = 2 "
        echo "We recommend that you review your addressing plan because it does not necessarily work in all cases"
      fi
      let " res = 2 ** $exposant "
      let " pas = 256 / $res "
      let " dernier = $pas - 1"
      let " netmaskDecimal = 256 - $pas "
      let " wildcard = $pas - 1 "
      echo -e "-> /$newmaskCidr in dotted decimal = 255.255.$netmaskDecimal.0 \n-> Wildcard mask = 0.0.$wildcard.255"
      read -p "One more network ? (O/n) : " rep
      rep=${rep:-O}
    else
      read -p "The order of magnitude is not respected (> 256)!`echo $'\n->'` Try again ? (O/n) : " rep
      rep=${rep:-O}
    fi
  elif [ $cidr -gt 24 ] && [ $cidr -lt 32 ]; then
    ip_1octet=`echo $ipv4 | cut -f1 -d.`
    ip_2octet=`echo $ipv4 | cut -f2 -d.`
    ip_3octet=`echo $ipv4 | cut -f3 -d.`
    ip_4octet=`echo $ipv4 | cut -f4 -d.`
    ip_cut="$ip_1octet.$ip_2octet.$ip_3octet.$ip_4octet"
    let " pasExemple = 32 - $cidr "
    let " pasExemple = 2 ** $pasExemple"
    read -p "What is your step ? ($pasExemple seems to be the most suitable) : " pas
    read -p "How many network do you want ? (ex : 2) " cmb_sr
    let " pasmax = cmb_sr * pas "
    j=1
    if [ $pasmax -ge 1 ] && [ $pasmax -le 256 ]; then
    let " pasmax = $pasmax + $ip_4octet "
    echo 
      for ((i = $ip_4octet ; i < $pasmax ; i += $pas)) # < pour éviter de dépasser 256
      do
          echo -e "Network $j  @ : $ip_1octet.$ip_2octet.$ip_3octet.$i"
          j=$[$j +1]
      done
      x=`log2 $pasmax`
      let " newmaskCidr = 32 - $x "
      echo -e "\nNew mask for summarization : /$newmaskCidr \nSummarization network : $ip_cut/$newmaskCidr"
      let " exposant = $newmaskCidr - 24  "
      if [ $exposant -lt 0 ]; then 
        let " exposant = 2 "
        echo "We recommend that you review your addressing plan because it does not necessarily work in all cases"
      fi
      let " res = 2 ** $exposant "
      let " pas = 256 / $res "
      let " dernier = $pas - 1"
      let " netmask = 256 - $pas "
      let " wildcard = $pas - 1 "
      echo -e "-> /$newmaskCidr in dotted decimal = 255.255.255.$netmask \n-> Wildcard mask = 0.0.0.$wildcard"
      read -p "One more network ? (O/n): " rep
      rep=${rep:-O}
    else 
      read -p "The order of magnitude is not respected (> 256)!`echo $'\n->'` Try again ? (O/n) : " rep
      rep=${rep:-O}
    fi
  else
    echo " CIDR need to be > /8 and < /31" 
    read -p "Try again ? (O/n) : " rep
    rep=${rep:-O}
  fi
done
echo "Bye bye"
clear