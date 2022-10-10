#Modification des informations d'un utilisateur

#Variables à définir
$login="MTutin"

Set-ADUser -Identity $login

Write-Host "Terminé"