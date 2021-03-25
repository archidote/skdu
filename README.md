# SKDU Project Swiss Knife Debian Ubuntu Project 
SKDU project has been create to 
facilitate the debian / ubuntu ... administration / monitoring. Enjoy :)

**WARNING** : You need to be root for executing skdu

## :pushpin: Auto installation 

run the following commands <b> as root </b> 

``` 
curl -sL https://raw.githubusercontent.com/brlndtech/skdu/master/install.sh | bash
``` 


## :pushpin: Hand installation (Old and note convenient)

on your linux server (DEBIAN Family), run the following commands <b>as root </b>: 

```
apt install git
cd /etc/
git clone https://github.com/brlndtech/skdu
chmod 700 -R skdu
nano /root/.bashrc
---
# add the following alias at the end of file
alias skdu='/etc/skdu/skdu'
---
source /root/.bashrc
# open a new terminal, and run "skdu" command as root. 
``` 

## :pushpin: install linux dependencies 

If you run skdu for the first time, run FIRSTLY the option "0" for install all the dependencies that skdu required. Then, you can enjoy the program as you want 



**WARNING** : You need to be root for executing skdu


## :point_right: Menu

This is the main menu of skdu, for more info about the sub-tools, start to use it :)

<img src="https://i.imgur.com/Kd9Zr75.png">



## :question: :speech_balloon:Issues 

1 -  Skdu is available only for debian family (Debian/Ubuntu/kalilinux/Elementary OS etc.)
**Readhat family is not fully compatible ! ** 


### Errors Code 

If you detect errors or bugs please open an github issue,

