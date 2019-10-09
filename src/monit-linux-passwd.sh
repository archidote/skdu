echo -e "\e[93m"
echo -e  "en cours ... "
echo -e "\e[0m";
read -p "Entrer le nom de l'utilisateur dont vous voulez changer le mdp : " user  
passwd $user
echo -e " \e[92m Le mot de passe de l'utilisateur $user a bien été changé  \e[0m"

