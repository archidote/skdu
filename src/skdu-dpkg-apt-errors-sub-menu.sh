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
echo -e "  3) Leave this sub-menu"
echo -e ""
read -p "Select an option : " answer
case $answer in
        1)
		/etc/skdu/src/skdu-apt-dpkgpb1.sh
        ;;
        2)
		/etc/skdu/src/skdu-apt-dpkgpb2.sh
        ;;
		3)
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
