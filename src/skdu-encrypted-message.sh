#!/bin/bash
source /etc/skdu/Globalfunction.cfg
clear
x=0
echo -e "*********************************************"
echo -e "* Sub menu for encrypt / decrypt file       *"
echo -e "*********************************************"
while [ x != 1 ] 
do
# clear 
echo -e "  0)  Generate public/private key with openssl"  
echo -e "  1)  Encrypt a file with AES-256-CBC -pbkdf2 -salt"
echo -e "  2)  Decrypt a file with AES-256-CBC -pbkdf2 -salt"
echo -e "  3)  Encrypt a file with your public key"
echo -e "  4)  Decrypt a file with your private key"
echo -e "  5)  Write something, and encrypt it with a public key !"
echo -e "  6)  Write something, and encrypt it with AES-256-CBC -pbkdf2 -salt !"
echo -e "  10) Exit the sub menu"
read -p "Select an option : " answer
case $answer in
    0)
    mkdir /root/myKeys
    openssl genrsa -out /root/myKeys/key.pem 4096
    openssl rsa -in /root/myKeys/key.pem -text -noout
    openssl rsa -in /root/myKeys/key.pem -pubout -out /root/myKeys/pub.pem
    openssl rsa -in /root/myKeys/pub.pem -pubin -text -noout
    echo 
    echo "Your private and public (4096 bits) has been written in the /root/myKeys/ folder "
    echo
    ls -alt /root/myKeys/*.pem
    echo -e "Press enter to continue"
	read
    ;;
    1)
    read -p "Enter the absolute path of the file that you want to encrypt, ex [/tmp/file.clear]: " fileC
    fileC=${fileC:-/tmp/file.clear} 
    ifFileExist $fileC
    openssl aes-256-cbc -pbkdf2 -e -salt -in $fileC -out /tmp/file.encrypted
    ifFileEncryptedExist
    echo -e "Press enter to continue"
	read
    ;;
    2)
    read -p "Enter the absolute path of the file that you want to decrypt, ex [/tmp/file.encrypted] : " fileE
    fileE=${fileE:-/tmp/file.encrypted} 
    ifFileExist $fileE
    openssl aes-256-cbc -pbkdf2 -d -in $fileE -out /tmp/file.decrypted
    ifFileDecryptedExist
    echo -e "Press enter to continue"
	read
    ;;
    3)
    read -p "Enter the absolute path of the file that you want to encrypt, ex [/tmp/file.txt]: " fileC
    fileC=${fileC:-/tmp/file.clear}
    read -p "Enter the absolute path of the file the public key, ex [/root/myKeys/pub.pem] : " pubKey
    pubKey=${pubKey:-/root/myKeys/pub.pem} 
    openssl rsautl -encrypt -inkey $pubKey -pubin -in $fileC -out /tmp/file.encrypted
    echo -e "Press enter to continue"
	read
    ;;
    4)
    read -p "Enter the absolute path of the file that you want to decrypt, ex [/tmp/file.encrypted] : " fileE
    fileE=${fileE:-/tmp/file.encrypted} 
    read -p "Enter the absolute path of your private key, ex [/root/myKeys/key.pem] : " pvKey
    pvKey=${pvKey:-/root/myKeys/key.pem} 
    openssl rsautl -decrypt -inkey $pvKey -in $fileE -out /tmp/file.decrypted
    ifFileDecryptedExist
    echo -e "Press enter to continue"
	read
    ;;
    5)
    read -p "Enter the absolute path of the file the public key, ex [/root/myKeys/pub.pem] : " pubKey
    pubKey=${pubKey:-/root/myKeys/pub.pem} 
    # read -p "Enter the e-mail of your recipient" email
    # read -p "Enter the object of the message : " object
    read -p "Enter the name of the future file : " fileC
    nano /tmp/$fileC.clear 
    openssl rsautl -encrypt -inkey $pubKey -pubin -in /tmp/$fileC.clear -out /tmp/file.encrypted
    ifFileEncryptedExist
    # echo "cf the attachment ->" | mail -s "$object" $email -A /tmp/message.encrypted
    echo -e "Press enter to continue"
	read
    ;;
    6)
    read -p "Enter the name of the future file: " fileC
    nano /tmp/$fileC.clear
    openssl aes-256-cbc -pbkdf2 -a -salt -in /tmp/$fileC.clear -out /tmp/file.encrypted
    ifFileEncryptedExist
    # echo "cf the attachment ->" | mail -s "$object" $email -A /tmp/message.encrypted
    echo -e "Press enter to continue"
	read
    ;;
    10)
	break
	;;
	*)
	clear    
	echo -e " \e[91m Enter ONLY an option between 1-10 \e[0m"
    ;;
esac
continue
done
clear
