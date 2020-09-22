#!/bin/bash
#!/bin/bash
isFileEncryptedExist() {
    if [ -e /tmp/file.encrypted ]; then
        echo "The encrypted file has been generated ! "
        ls /tmp/file.encrypted
    else
        echo "\e[91m Error, the encrypted file has not be created for a unknow reason.\e[0m "
    fi
}
isFileDecryptedExist() {
    if [ -e /tmp/file.decrypted ]; then
        echo "The decrypted file has been generated ! "
        ls /tmp/file.decrypted
    else
        echo "\e[91m Error, the decrypted file has not be created for a unknow reason.\e[0m "
    fi   
}
sendToEmail () {
    echo
}
clear
x=0
echo -e "*********************************************"
echo -e "* Sub menu for encrypt / decrypt file       *"
echo -e "*********************************************"
while [ x != 1 ] 
do
# clear 
echo -e "  0)  Generate public/private key with openssl"  
echo -e "  1)  Encrypt a file with AES-256-CBC -pbkdf2 -salt   : "
echo -e "  2)  Decrypt a file (AES-256-CBC -pbkdf2 -salt): "
echo -e "  3)  Encrypt a file with your public key : "
echo -e "  4)  Decrypt a file with your private key : "
echo -e "  5)  Write something, and encrypt it ! "
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
    openssl aes-256-cbc -pbkdf2 -a -salt -in $fileC -out /tmp/file.encrypted
    isFileEncryptedExist
    echo -e "Press enter to continue"
	read
    ;;
    2)
    read -p "Enter the absolute path of the file that you want to encrypt, ex (/root/file.txt) : " fileE
    openssl aes-256-cbc -pbkdf2 -d -a -in $fileE -out /tmp/file.decrypted
    isFileDecryptedExist
    echo -e "Press enter to continue"
	read
    ;;
    3)
    read -p "Enter the absolute path of the file that you want to encrypt, ex (/root/file.txt) : " fileC
    read -p "Enter the absolute path of the file the public key, ex (/root/myKey/pub.pem) : " pubKey
    pubKey=${pubKey:-/root/myKey/pub.pem} 
    openssl rsautl -encrypt -inkey $pubKey -pubin -in $fileC -out /tmp/file.encrypted
    echo -e "Press enter to continue"
	read
    ;;
    4)
    read -p "Enter the absolute path of the file that you want to decrypt, ex (/tmp/file.enc) : " fileE
    read -p "Enter the absolute path of your private key, ex (/root/myKey/key.pem) : " pvKey
    pubKey=${pubKey:-/root/myKey/key.pem} 
    openssl rsautl -decrypt -inkey $pvKey -in $fileE -out /tmp/file.decrypted
    isFileDecryptedExist
    echo -e "Press enter to continue"
	read
    ;;
    5)
    read -p "Enter the absolute path of the file the public key, ex (/root/myKey/pub.pem) : " pubKey
    pubKey=${pubKey:-/root/myKey/pub.pem} 
    # read -p "Enter the e-mail of your recipient" email
    # read -p "Enter the object of the message : " object
    read -p "Enter the name of the file : " fileC
    nano /tmp/$fileC.clear 
    openssl rsautl -encrypt -inkey $pubKey -pubin -in /tmp/$fileC.clear -out /tmp/file.encrypted
    isFileEncryptedExist
    # echo "cf the attachment ->" | mail -s "$object" $email -A /tmp/message.encrypted 
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