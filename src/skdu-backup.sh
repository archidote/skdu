#!/bin/bash
source /etc/skdu/Globalfunction.cfg
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
clear