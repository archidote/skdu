#!/bin/bash
clear
x=0
echo -e "**************************************************"
echo -e "| - Sub menu for do some backups - |"
echo -e "**************************************************"
while [ x != 1 ] 
do
echo -e ""
echo -e "  1) Backup with cp -r a folder "
echo -e "  2) Create a .tar.gz archive"
echo -e "  3) Create a zip archive "
echo -e "  4) exit "
read -p "Select an option : " nmap_rep
case $nmap_rep in
        1)
		if [ -d "/backup" ];then
			clear
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Sauvegarde en cours ... \e[0m";
			cp -r $target /backup/$target-$(date +%d-%m-%Y-%H-%M-%S)
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m Action éfféctuée. -> Dossier sauvegardé. Pour le visualiser : cd /backup$target \e[0m";
		else
			clear
			mkdir /backup
			read -p "Enter the absolute PATH : " target  
			echo -e  "\e[33m Sauvegarde en cours ... \e[0m";
			cp -r $target /backup/$target-$(date +%d-%m-%Y-%H-%M-%S)
			echo -e "\e[92m Action éfféctuée. -> Dossier sauvegardé. Pour le visualiser : cd /backup$target \e[0m";
		fi
        ;;
        2)
		if [ -d "/backup" ];then
			clear
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Sauvegarde en cours ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			nameoftargz="$target-$d"
			tar czvf $nameoftargz.tar.gz $target && mv /$nameoftargz.tar.gz /backup
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m Action éfféctuée. -> Dossier sauvegardé en .tar.gz. Pour le visualiser : cd /backup$target \e[0m";
			echo -e " for decompress the tar.gz archive : tar -xvf archive.tar.gz"
		else
			mkdir /backup
			clear
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Sauvegarde en cours ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			nameoftargz="$target-$d"
			tar czvf $nameoftargz.tar.gz $target && mv /$nameoftargz.tar.gz /backup
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m Action éfféctuée. -> Dossier sauvegardé en .tar.gz. Pour le visualiser : cd /backup$target \e[0m";
			echo -e " for decompress the tar.gz archive : tar -xvf archive.tar.gz"
		fi
		;;
		4)
		break
		;;
		*)      
		echo "Enter ONLY an option between 1-7"
        ;;
esac
continue 
done
