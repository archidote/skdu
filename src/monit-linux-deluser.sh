echo -e "\e[93m "
echo -e "En cours ... "
echo -e "\e[0m";
     read -p "Entrer le nom de l'utilisateur à SUPPRIMER : " user  
     /usr/sbin/deluser $user
     rm -r /home/$user
echo -e " \e[92m L'utilisateur $user a bien été supprimé, ainsi que son dossier personnel /home/$user. \e[0m"
