#!/bin/bash
ip=`ip -o -f inet addr show | awk '/scope global/ {print $4}' | head -1`
hostname=`hostname -s`
dnsdname=`hostname -d`
dns1=`cat /etc/resolv.conf | grep -m 1 'nameserver' | cut -c12-`
dns2=`cat /etc/resolv.conf | tail -1 | cut -c12-`
hdd=`df -h /dev/sda1 --output=fstype,size,used,avail,pcent`
echo -e "########################################################################################################"
echo -e "                                     Information Concernant le système                                  "
echo -e "########################################################################################################"
echo -e " Hostname        : $hostname             DNS 1/ : $dns1  2/ $dns2                                       "
echo -e " DNS Domain name : $dnsdname                                                                            "
echo -e " Main ip address : $ip                                                                                  "
echo -e " HDD info :                                                                                             "
echo -e " $hdd                                                                                                   "
echo -e "--------------------------------------------------------------------------------------------------------"
