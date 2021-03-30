#!/bin/bash
clear
ip=`ip -o -f inet addr show | awk '/scope global/ {print $4}' | head -1`
hostname=`hostname -s`
dnsdname=`hostname -d`
os=`hostnamectl | grep Operating | cut -c21-`
kernel=`hostnamectl | grep "Kernel" | cut -c13-`
architecture=`hostnamectl | grep "Architecture" | cut -c21-`
upt=`uptime -p`
cpuType=`cat /proc/cpuinfo | grep -m1 "model name" | cut -c14-`
coreNumber=`nproc` 
osLike=`cat /etc/os-release | grep LIKE | cut -c9-`
dns1=`cat /etc/resolv.conf | grep -m 1 'nameserver' | cut -c12-`
dns2=`cat /etc/resolv.conf | tail -1 | cut -c12-`
hdd=`lsblk`
echo -e "######################################################################"
echo -e "\e[92m                      Info about you system                \e[0m"
echo -e "######################################################################"
echo -e " OS              : $os                                              "
echo -e " Architecture    : $architecture                                    "
echo -e " Kernel          : $kernel                                          "
echo -e " CPU type        : $cpuType                                         "
echo -e " CPU(s)          : $coreNumber                                      "
echo -e " Uptime          : $upt                                             "
echo -e " Hostname        : $hostname                                        "
echo -e " DNS Domain name : $dnsdname                                        "
echo -e " Main ip address : $ip                                              "
echo -e " DNS (2)         : DNS 1/ : $dns1  2/ $dns2                         "
echo -e " HDD(s)          :                                                  "
echo -e " $hdd                                                               "
echo -e "                                                                    "
echo -e "Press enter to continue "
read
clear
