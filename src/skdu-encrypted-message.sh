#!/bin/bash
#!/bin/bash
clear
x=0
echo -e "*********************************************"
echo -e "* Sub menu for encrypt / decrypt file       *"
echo -e "*********************************************"
while [ x != 1 ] 
do
clear 
echo -e "  0)  Generate public/private key with openssl"  
echo -e "  1)  Encrypt a file with AES-256-CBC -pbkdf2 -salt   : "
echo -e "  2)  Decrypt a file (AES-256-CBC -pbkdf2 -salt): "
echo -e "  3)  Encrypt a file with your public key : "
echo -e "  4)  Decrypt a file with your private key : "
echo -e "  10) Exit the sub menu  "
read -p "Select an option : " answer
case $answer in
    0)
    mkdir /root/myKey
    openssl genrsa -out /root/myKey/key.pem 4096
    openssl rsa -in /root/myKey/key.pem -text -noout
    openssl rsa -in /root/myKey/key.pem -pubout -out /root/myKey/pub.pem
    openssl rsa -in /root/myKey/pub.pem -pubin -text -noout
    echo 
    echo "Your private and public (4096 bits) has been written in the /root/myKey/ folder "
    echo
    ls -alt /root/myKey/*.pem
    echo -e "Press enter to continue"
	read
    ;;
    1)
    read -p "Enter the absolute path of the file that you want to encrypt, ex (/root/file.txt) : " fileC
    openssl aes-256-cbc -pbkdf2 -a -salt -in $fileC -out /tmp/file.enc
    echo -e "Your file has been saved into /tmp/file.enc"
    echo -e "Press enter to continue"
	read
    ;;
    2)
    read -p "Enter the absolute path of the file that you want to encrypt, ex (/root/file.txt) : " fileE
    openssl aes-256-cbc -pbkdf2 -d -a -in $fileE -out /tmp/file.decrypted
    echo -e "Your file has been saved into /tmp/file.decrypted"
    echo -e "Press enter to continue"
	read
    ;;
    3)
    read -p "Enter the absolute path of the file that you want to encrypt, ex (/root/file.txt) : " fileC
    read -p "Enter the absolute path of the file the public key, ex (/root/myKey/pub.pem) : " pubKey
    openssl rsautl -encrypt -inkey $pubKey -pubin -in $fileC -out /tmp/file.enc
    echo -e "Your file has been saved into /tmp/file.enc"
    echo -e "Press enter to continue"
	read
    ;;
    4)
    read -p "Enter the absolute path of the file that you want to decrypt, ex (/tmp/file.enc) : " fileE
    read -p "Enter the absolute path of your private key, ex (/root/myKey/key.pem) : " pvKey
    openssl rsautl -decrypt -inkey $pvKey -in $fileE -out /tmp/file.decrypt
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