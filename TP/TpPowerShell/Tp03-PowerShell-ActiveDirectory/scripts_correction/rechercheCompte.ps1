#Recherche d'un utilisateur

#Variables à définir
$login="MTutin"

Get-ADUser -Filter {sAMAccountName -eq $login}

