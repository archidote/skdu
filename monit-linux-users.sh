#!/bin/bash
# for more infos, check my github : https://github.com/brlndtech/monit-linux-project
#echo -e ''"Hostname :" $tecreset $HOSTNAME
#cat /etc/os-release | grep 'NAME\|VERSION' | grep -v 'VERSION_ID' | grep -v 'PRETTY_NAME' > /tmp/osrelease
#echo -n -e ''"OS Name :" $tecreset  && cat /tmp/osrelease | grep -v "VERSION" | cut -f2 -d\"
#echo -n -e ''"OS Version :" $tecreset && cat /tmp/osrelease | grep -v "NAME" | cut -f2 -d\"
#architecture=$(uname -m)
# echo -e ''"Architecture :" $tecreset $architecture
#kernelrelease=$(uname -r)
jour=`LANG=en_GB date '+%a %b  %-d'`
#echo -e ''"Kernel Release :" $tecreset $kernelrelease
echo -e ":¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨:"
echo -e ":    MONIT LINUX USERS  LOGS                                             :"
echo -e ":                                                                        :"
echo -e ":    A simple tool to monitor the users logs on linux                    :"
echo -e ":    -> This logs report is valid for : `date +%d/%m/%y`                         :"
echo -e ":                                               coded by Brlndtech - 2019:"
echo -e "¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨"
echo " ________________________________________________________________________"
echo "|                                                                        |"
echo "|                List of users who are currently connected               |"
echo "|________________________________________________________________________|"
echo "* Users  | pts |///////| YY MM DD Hour | IP address | ////////////////// * "
echo "*------------------------------------------------------------------------*"
who --ips
echo " ________________________________________________________________________"
echo "|                                                                        |"
echo "|     List of users who was connected or disconnected for today          |"
echo "|________________________________________________________________________|"
echo "* Users | pts |///////|    IP @   |///| DD MM  N°D Hr -> | hr <- | N°h Co*"
echo "*------------------------------------------------------------------------*"
last -i | grep -e "$jour"
echo ""
