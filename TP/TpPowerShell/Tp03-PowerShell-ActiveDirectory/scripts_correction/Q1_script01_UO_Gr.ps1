﻿#Création d'une unité d'organisation et d'un groupe dans cette unité

Import-Module ActiveDirectory

#Variables à définir
$domaineParent="btssio"
$sousDomaine="D00"
$unite="C1E01"
$groupe="Gr01"

#variables construites
$domaineAD="DC=$sousDomaine,DC=$domaineParent"

New-ADOrganizationalUnit -Path $domaineAD -Name $unite -ProtectedFromAccidentalDeletion $false

New-ADGroup -Path "OU=$unite,$domaineAD" -Name $groupe -GroupScope Global

Write-Host "Terminé"