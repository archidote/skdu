#!/bin/bash 
git clone https://github.com/brlndtech/skdu
mv skdu /etc
cat >> $HOME/.bashrc << EOF
# alias added by bestAliasLinux (Brlndtech Edit)  
alias skdu='/etc/skdu/skdu'
EOF
source $HOME/.bashrc
echo -e "\e[92mDone, please open a new terminal tab, and run \"skdu\" cmd\e[39m"
