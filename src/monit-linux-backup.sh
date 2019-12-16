#!/bin/bash
clear
x=0
echo -e "**************************************************"
echo -e "| ---       Sub menu for do some backups     --- |"
echo -e "**************************************************"
while [ x != 1 ] 
do
echo -e ""
echo -e "  1) Backup with cp -r a folder "
echo -e "  2) Create a .tar.gz archive (FROM A FOLDER)"
echo -e "  3) Create a zip archive (FROM A FOLDER) "
echo -e "  4) exit "
read -p "Select an option : " nmap_rep
case $nmap_rep in
        1)
		if [ -d "/backup" ];then
			clear
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Loading ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			folder="backup-$d"
			cp -r $target /backup/$folder
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m-> Saved folder ($target) \nLocation : /backup/$folder \e[0m";
		else
			clear
			mkdir /backup
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Loading ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			folder="backup-$d"
			# folderFinal="$(echo $folder | cut -c2-)" # cette action permet d'obtenir le nom sans / (pas obligatoire, mais je trouve que c'est plus propre)
			cp -r $target /backup/$folder
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m-> Saved folder ($target) \nLocation : /backup/$folder \e[0m";
		fi
        ;;
        2)
		if [ -d "/backup" ];then
			clear
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Loading ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			nameoftargz="backup-$d"
			# nameoftargzFinal="$(echo $nameoftargz | cut -c2-)" # cette action permet d'obtenir le nom sans / (pas obligatoire, mais je trouve que c'est plus propre)
			tar czvf /backup/$folder.tar.gz $target
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m-> Saved folder ($target) into a .tar.gz file \nLocation : /backup/$nameoftargz.tar.tgz \e[0m";
			echo -e "For decompress the tar.gz archive go into /backup and : tar -xvf $nameoftargz.tar.tgz"
		else
			clear
			mkdir /backup
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Loading ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			nameoftargz="backup-$d"
			# nameoftargzFinal="$(echo $nameoftargz | cut -c2-)" # cette action permet d'obtenir le nom sans / (pas obligatoire, mais je trouve que c'est plus propre)
			tar czvf /backup/$folder.tar.gz $target
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m-> Saved folder ($target) into a .tar.gz file \nLocation : /backup/$nameoftargz.tar.tgz \e[0m";
			echo -e "For decompress the tar.gz archive go into /backup and : tar -xvf $nameoftargz.tar.tgz"
		fi
		;;
		3)
		if [ -d "/backup" ];then
			clear
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Loading ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			folder="backup-$d"
			# folderFinal="$(echo $folder | cut -c2-)" # cette action permet d'obtenir le nom sans / (pas obligatoire, mais je trouve que c'est plus propre)
			zip -r /backup/$folder.zip $target
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m-> Saved folder $target into a .zip file \nLocation : /backup/$folder.zip \e[0m";
			echo -e "For decompress the .zip archive go into /backup and : unzip $folder.zip "
		else
			clear
			mkdir /backup
			read -p "Enter the ABSOLUTE PATH : " target  
			echo -e  "\e[33m Loading ... \e[0m";
			d=`date +%d-%m-%Y-%H-%M-%S`
			folder="backup-$d"
			# folderFinal="$(echo $folder | cut -c2-)" # cette action permet d'obtenir le nom sans / (pas obligatoire, mais je trouve que c'est plus propre)
			zip -r /backup/$folder.zip $target
			# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
			echo -e "\e[92m-> Saved folder $target into a .zip file \nLocation : /backup/$folder.zip \e[0m";
			echo -e "For decompress the .zip archive go into /backup and : unzip $folder.zip "
		fi
		;;
		4)
		clear
		break
		;;
		*)
		clear   
		echo -e " \e[91m Enter ONLY an option between 1-4 \e[0m "
        ;;
esac
continue 
done
