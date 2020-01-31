#!/bin/bash
clear
echo -e "---------------------------------------------------------------"
echo -e "| Ssh failed/accepted log for today : (`date +%d" "%b" "%Y`)          |"
echo -e "---------------------------------------------------------------"
echo -e "" 
echo -e "\e[91mFailed password for know user : \e[0m "
echo -e "" 
journalctl -u ssh | grep "`date +%b" "%d`" | grep "Failed password"
echo -e "" 
echo -e "\e[91mFailed password for invalid user (unknow user(s)) \e[0m"
echo -e ""
journalctl -u ssh | grep "`date +%b" "%d`" | grep "for invalid"
echo -e ""
echo -e "\e[92mAccepted pawword for \e[0m"
echo -e "" 
journalctl -u ssh | grep "`date +%b" "%d`" | grep "Accepted password"
echo -e ""
echo -e "Press enter to continue"
read
clear
