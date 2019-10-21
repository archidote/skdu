#!/bin/bash
read -p "Mettre à jours le paramétrage IP ? (O/N)" rep1
      if [ $rep1 == "O" ] || [ $rep1 == "o" ]; then
         echo -e ""
         ip link show
         echo -e "" 
         read -p "Entrer le nom de l'interface reseau : (Attention vous allez perdre la main sur votre serveur si vous êtes en SSH) : " netInt
         # sudo ifconfig $netInt down;
         read -p "Entrer la nouvelle addresse suivi du masque CIDR exemplt : 192.168.0.2 24 : " ipMasque
         sudo ifconfig $netInt $ipMasque
         # sudo ifconfig $netInt up;
         echo -e "L'ip et le masque ont du changer : "
         ip a
         read -p "Voulez vous changer la passerelle (gateway) ? (O/N) :" rep2
         if [ $rep2 == "O" ] || [ $rep2 == "o" ]; then
            read -p "Entrer la nouvelle passerel (gateway) : " gateway
            sudo route add default gw $gateway;
            echo -e "Action effectué";
         else
            echo -e "Pas de changement de passerell"
         fi 
      else
          echo " \e[93m Les paramètre du réseau n'ont pas été modifié. \e[0m "
     fi
