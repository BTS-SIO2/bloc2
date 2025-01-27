﻿#Création d'un utilisateur dans une unité d'organisation
#et affectation de cet utilisateur dans un groupe

#Variables à définir
$domaineprincipal="btssio"
$sousdomaine="D00"
$unite="C1E01"
$groupe="Gr01"
$prenom="Michel"
$nom="Tutin"
$login="MTutin"
$motdepasse="Toto0101"

#variables construites
$domaineAD="DC=$sousDomaine,DC=$domaineParent"
$loginComplet="$login@$sousDomaine.$domaineParent"

$secret=ConvertTo-SecureString -AsPlainText $motdepasse -Force

New-ADUser -Path "OU=$unite,$domaineAD" -Name $login -UserPrincipalName $loginComplet `
-sAMAccountName $login -GivenName $prenom -Surname $nom -AccountPassword $secret

Add-ADGroupMember -Identity $groupe -Members $login

Write-Host "Terminé"