#Variables à définir
$domaineprincipal="btssio"
$sousdomaine="D00"
$unite="C1E01"
$login="MTutin"

#variables construites
$domaine="DC=$sousdomaine,DC=$domaineprincipal"
$UO="OU=$unite,$domaine"
#autre solution pour la variable $UO : $UO="OU=C1E01,DC=D00,DC=btssio"

# 1. Toutes les unités d’organisation du domaine :
Get-ADOrganizationalUnit -Filter *

# 2. Tous les utilisateurs du domaine :
Get-ADUser -Filter *

# 3. Tous les ordinateurs du domaine :
Get-ADComputer -Filter *

# 4. Tous les utilisateurs de l’unité Labo :
Get-ADUser -Filter * -SearchBase $UO

# 5. Tous les groupes de l’unité Labo :
Get-ADGroup -Filter * -SearchBase $UO

# 6. Toutes les informations de l’utilisateur créé au 2) :
Get-ADUser -Identity $login

# 7. Tous les utilisateurs dont le compte a expiré :
Search-ADAccount -AccountExpired

# 8. Tous les utilisateurs dont le compte est désactivé :
Search-ADAccount -AccountDisabled

# 9. Tous les utilisateurs dont le mot de passe n’expire jamais :
Search-ADAccount -PasswordNeverExpires

# 10. Tous les utilisateurs dont le compte est resté inactif pendant les 10 derniers jours :
Search-ADAccount -AccountInactive -TimeSpan 10



