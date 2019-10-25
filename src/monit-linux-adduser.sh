clear
echo -e "\e[93m"
echo -e "En cours ... "
echo -e "\e[0m"
read -p "Entrer le nom de l'utilisateur à ajouter : " user  
/usr/sbin/adduser --force-badname $user
echo -e " \e[92m L'utilisateur $user a bien été crée et ajouté. Dossier personnel : /home/$user \e[0m"

