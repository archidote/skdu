#!/bin/bash
clear
ip=`ip -o -f inet addr show | awk '/scope global/ {print $4}' | head -1`
hostname=`hostname -s`
dnsdname=`hostname -d`
os=`hostnamectl | grep Operating | cut -c21-`
kernel=`hostnamectl | grep Kernel | cut -c21-`
osLike=`cat /etc/os-release | grep LIKE | cut -c9-`
dns1=`cat /etc/resolv.conf | grep -m 1 'nameserver' | cut -c12-`
dns2=`cat /etc/resolv.conf | tail -1 | cut -c12-`
hdd=`df -h /dev/sda1 --output=size,used,avail,pcent`
echo -e "######################################################################"
echo -e "\e[92m                      Info about you system                \e[0m"
echo -e "######################################################################"
echo -e " OS              : $os                                              "
echo -e " Kernel          : $kernel                                          "
echo -e " Hostname        : $hostname                                        "
echo -e " DNS Domain name : $dnsdname                                        "
echo -e " Main ip address : $ip                                              "
echo -e " DNS (2)         : DNS 1/ : $dns1  2/ $dns2                         "
echo -e " HDD /dev/sda1   :                                                  "
echo -e " $hdd                                                               "
echo -e "                                                                    "
echo -e "Press enter to continue "
read
clear
