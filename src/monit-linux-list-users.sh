#!/bin/bash
clear
grep bash /etc/passwd | cut -f1 -d:
#-d veut dire on coupe la ligne juste avant les : 
echo -e "Press enter to continue"
read

