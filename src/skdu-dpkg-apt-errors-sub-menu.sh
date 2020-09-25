#!/bin/bash
clear
x=0
echo -e "**************************************************"
echo -e "|    - Sub menu for solve apt / dpkg errors     - |"
echo -e "**************************************************"
while [ x != 1 ] 
do
echo -e ""
echo -e "  1) E: Unable to lock the administration directory (/var/lib/dpkg/)"
echo -e "  2) E: sub-process /usr/bin/dpkg returned an error code  "
# echo -e "  3) E: Unable to lock the administration directory"
echo -e "  4) exit  "

echo -e ""
read -p "Select an option : " answer
case $answer in
        1)
		clear
		rm -f /var/lib/dpkg/lock
		echo -e "Action done ! "
		echo -e "\e[93mCheck if the problem has been resolved, with apt update && apt upgrade\e[0m"
		echo -e "Reboot to be sure :)" 
		echo
		echo -e "Press enter to continue"
		read
		clear
        ;;
        2)
		#!/bin/bash
		clear
		read -p "Enter the name of the blocking packet (Ex : apache2)" packet
		rm /var/lib/dpkg/info/$packet* -f
		echo -e "Action done ! "
		echo -e "\e[93mCheck if the problem has been resolved, with apt update && apt upgrade \e[0m"
		echo -e "Reboot to be sure :)" 
		echo -e "Press enter to continue"
		read
		clear
        ;;
		3)
		echo 
		;;
		4)
		clear
		break
		;;
		*)
		clear
		echo -e "\e[91m Enter ONLY an option between 1-7 \e[0m"
        ;;
esac
continue 
done
clear
