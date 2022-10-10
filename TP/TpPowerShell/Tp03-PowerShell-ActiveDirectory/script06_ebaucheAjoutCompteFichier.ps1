# Tp02, question 6, ajout des comptes dans AD
# Script à compléter

Import-Module ActiveDirectory

$fichier="c:\Tp02PSUtilisateurs.txt"

#Variables à définir
$domaineParent=
$sousDomaine=
$unite=
$groupe=
$motdepasse="Toto0101"
$scriptPath="script.cmd" 
$HomeDrive="P:"
$dossierData="" 

$domaineAD="DC=$sousDomaine,DC=$domaineParent"
$secret=ConvertTo-SecureString -AsPlainText $motdepasse -Force

$colLignes=Get-Content $fichier
$nbcompte=0

foreach($ligne in $colLignes){
  
		# A complèter : récupération des infos d'un compte
        $tabCompte=$ligne.Split(";")
        $prenom=
        $nom=
        $displayname=
		$init=
        $login=$init+$nom
        $loginComplet=     
        $HomeDirectory=

        #A complèter : Ajout du compte avec toutes les informations, activation, etc.. 
        New-ADUser -Path "OU=$unite,$domaineAD" -Name $login -userPrincipalName $loginComplet -sAMAccountName $login `
		
		
		
     
		# A complèter : ajout du compte dans le groupe
        Add-ADGroupMember

		#A complèter : création du dossier personnel
        New-Item
		
		#Définition des droits sur le dossier personnel
        $perm=$login+":F"
        cacls $HomeDirectory /T /E /C /G $perm
		
		$nbcompte++
}

Write-Host "nombre de comptes créés : $nbcompte"
 