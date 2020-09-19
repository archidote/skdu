#!/bin/bash
backupFolder() {			
	clear
	read -p "Enter the ABSOLUTE PATH (ex : /var/log/): " target  
	d=`date +%d-%m-%Y-%H-%M-%S`
	folder="backup-$d"
	cp -r $target /backup/$folder
	# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
	echo -e "\e[92m-> Saved folder ($target) \nLocation : /backup/$folder \e[0m";
	echo
	echo -e "\e[92m ls of backupfolder /backup \e[0m $(ls -lt /backup)" 
	echo -e "Press enter to continue"
	read 
}
backupTar() {
	clear
	read -p "Enter the ABSOLUTE PATH (ex : /var/log/): " target  
	d=`date +%d-%m-%Y-%H-%M-%S`
	folder="backup-$d"
	tar czvf /backup/$folder.tar.gz $target
	# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
	echo -e "\e[92m-> Saved folder ($target) into a .tar.gz file \nLocation : /backup/$folder.tar.tgz \e[0m";
	echo -e "For decompress the tar.gz archive go into /backup and : tar -xvf $folder.tar.tgz"
	echo
	echo -e "\e[92m ls of backupfolder /backup \e[0m $(ls -lt /backup)" 
    echo -e "Press enter to continue"
	read 
}
backupZip() {
	clear
	read -p "Enter the ABSOLUTE PATH (ex : /var/log/): " target  
	d=`date +%d-%m-%Y-%H-%M-%S`
	folder="backup-$d"
	# folderFinal="$(echo $folder | cut -c2-)" # cette action permet d'obtenir le nom sans / (pas obligatoire, mais je trouve que c'est plus propre)
	zip -r /backup/$folder.zip $target
	# on ne peut pas utiliser un underscore, car il efface le contenue de la variable $target ... 
	echo -e "\e[92m-> Saved folder $target into a .zip file \nLocation : /backup/$folder.zip \e[0m";
	echo -e "For decompress the .zip archive go into /backup and : unzip $folder.zip "
	echo
	echo -e "\e[92m ls of backupfolder /backup \e[0m $(ls -lt /backup)" 
	echo -e "Press enter to continue"
	read 
}
clear
x=0
echo -e "**************************************************"
echo -e "| ---       Sub menu for do some backups     --- |"
echo -e "**************************************************"
while [ x != 1 ] 
do
clear
echo
echo -e "  1) Backup with cp -r a folder "
echo -e "  2) Create a .tar.gz archive (FROM A FOLDER)"
echo -e "  3) Create a zip archive (FROM A FOLDER) "
echo -e "  4) exit "
read -p "Select an option : " backupRep
case $backupRep in
        1)
		if [ -d "/backup" ];then
			backupFolder
		else
			echo "/backup does not exist, creating .."
			sleep 2
			mkdir /backup
			backupFolder
		fi
        ;;
        2)
		if [ -d "/backup" ];then
			backupTar
		else
			echo "/backup does not exist, creating .."
			sleep 2
			mkdir /backup
			backupTar
		fi
		;;
		3)
		if [ -d "/backup" ];then
			backupZip
		else
			echo "/backup does not exist, creating .."
			sleep 2
			mkdir /backup
			backupZip
		fi
		;;
		4)
		break
		;;
		*) 
		echo -e " \e[91m Enter ONLY an option between 1-4 \e[0m "
		sleep 2 
        ;;
esac
continue 
done
