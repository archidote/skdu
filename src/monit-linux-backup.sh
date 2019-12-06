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
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Loading ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			folder="$target-$d"
			folderFinal="$(echo $folder | cut -c2-)" # cette action permet d'obtenir le nom sans / (pas obligatoire, mais je trouve que c'est plus propre)
			cp -r $target /backup/$folderFinal
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m-> Saved folder ($target) \nLocation : /backup/$folderFinal \e[0m";
		else
			mkdir /backup
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Loading ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			folder="$target-$d"
			folderFinal="$(echo $folder | cut -c2-)" # cette action permet d'obtenir le nom sans / (pas obligatoire, mais je trouve que c'est plus propre)
			cp -r $target /backup/$folderFinal
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m-> Saved folder ($target) \nLocation : /backup/$folderFinal \e[0m";
		fi
        ;;
        2)
		if [ -d "/backup" ];then
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Loading ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			nameoftargz="$target-$d"
			nameoftargzFinal="$(echo $nameoftargz | cut -c2-)" # cette action permet d'obtenir le nom sans / (pas obligatoire, mais je trouve que c'est plus propre)
			tar czvf $nameoftargzFinal.tar.gz $target && mv $nameoftargzFinal.tar.gz /backup
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m-> Saved folder ($target) into a .tar.gz file \nLocation : /backup/$nameoftargzFinal.tar.tgz \e[0m";
			echo -e "For decompress the tar.gz archive go into /backup and : tar -xvf $nameoftargzFinal.tar.tgz"
		else
			mkdir /backup
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Loading ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			nameoftargz="$target-$d"
			nameoftargzFinal="$(echo $nameoftargz | cut -c2-)" # cette action permet d'obtenir le nom sans / (pas obligatoire, mais je trouve que c'est plus propre)
			tar czvf $nameoftargzFinal.tar.gz $target && mv $nameoftargzFinal.tar.gz /backup
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m-> Saved folder ($target) into a .tar.gz file \nLocation : /backup/$nameoftargzFinal.tar.tgz \e[0m";
			echo -e "For decompress the tar.gz archive go into /backup and : tar -xvf $nameoftargzFinal.tar.tgz"
		fi
		;;
		3)
		if [ -d "/backup" ];then
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Loading ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			folder="$target-$d"
			folderFinal="$(echo $folder | cut -c2-)" # cette action permet d'obtenir le nom sans / (pas obligatoire, mais je trouve que c'est plus propre)
			zip -r /backup/$folderFinal.zip $target
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m-> Saved folder ($target) \nLocation : /backup/$folderFinal.zip \e[0m";
			echo -e "For decompress the .zip archive go into /backup and : unzip $folderFinal.zip "
		else
			mkdir /backup
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Loading ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			folder="$target-$d"
			folderFinal="$(echo $folder | cut -c2-)" # cette action permet d'obtenir le nom sans / (pas obligatoire, mais je trouve que c'est plus propre)
			zip -r /backup/$folderFinal.zip $target
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m-> Saved folder ($target) \nLocation : /backup/$folderFinal.zip \e[0m";
			echo -e "For decompress the .zip archive go into /backup and : unzip $folderFinal.zip "
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