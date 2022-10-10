#Modification des informations d'un utilisateur

#Variables à définir
$login="MTutin"
$script="test.cmd"
$dossierperso="\\win2008\data\$login"
$lecteur="s:"

Set-ADUser -Identity $login -Enabled $true -ChangePasswordAtLogon $true `
-ScriptPath $script -HomeDirectory $dossierperso -HomeDrive $lecteur

New-Item -Path $dossierperso -ItemType Directory

Write-Host "Terminé"

