#!/bin/bash
clear
read -p "Minutes (0-59) (ALL = *) : " min
read -p "Hour (0-23) (ALL = *) : " hour
read -p "Day of the month (1-31) (ALL = *) : " dofmonth
read -p "Number of the month (1-12) (ALL = *) : " month
read -p "The day in the week (1-7) -> 1 = monday ... (ALL = *) : " dofweek
read -p "User (commonly root) : " user
echo -e " --- ABSOLUTE PATH of your script | cmd --- "
read -p "Enter your command  (like : /sbin/reboot | /root/myscript.sh) : " cmd 
echo -e "$min $hour   $dofmonth $month $dofweek   $user    $cmd " >> /etc/crontab
systemctl restart cron
echo ""
echo -e " \e[33m Cron daemon has been restarted with systemctl restart cron : Be aware that a wrong cron job can damaged your system \e[0m "
echo -e "NOTE : The modification have been written into /etc/crontab (file)" 
echo -e "Press enter to continue "
read
clear
