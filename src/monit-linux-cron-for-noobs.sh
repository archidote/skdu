#!/bin/bash
# /etc/crontab -- 
read -p "Enter the minutes (0-59) (ALL = *) : " min
read -p "Enter the hour (0-23) (ALL = *) : " hour
read -p "Enter the day of the month (1-31) (ALL = *) : " dofmonth
read -p "Enter the number of the month (1-12) (ALL = *) : " month
read -p "Enter the the day in the week (1-7) -> 1 = monday ... (ALL = *) : " dofweek
read -p "Enter the user (commonly root) : " user
echo -e " --- Enter the ABSOLUTE PATH of your script | cmd --- "
read -p "Enter your command  (like : /sbin/reboot | /root/myscript.sh) : " cmd 
echo -e "$min $hour   $dofmonth $month $dofweek   $user    $cmd " >> /etc/crontab