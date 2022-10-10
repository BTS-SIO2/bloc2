# Tp02, question 6, ajout des comptes dans AD
# Script à compléter

Import-Module ActiveDirectory

$fichier="c:\Tp02PSUtilisateurs.txt"

#Variables à définir
$domaineParent="btssio"
$sousDomaine="D00"
$unite="LaboPS"
$groupe="GrPS"
$motdepasse="Toto0101"
$scriptPath="script.cmd" 
$HomeDrive="P:"
$dossierData="\\win2008\data\"

$domaineAD="DC=$sousDomaine,DC=$domaineParent"
$secret=ConvertTo-SecureString -AsPlainText $motdepasse -Force

$colLignes=Get-Content $fichier
$nbcompte=0

foreach($ligne in $colLignes){
  
		# A complèter : récupération des infos d'un compte
        $tabCompte=$ligne.Split(";")
        $prenom=$tabCompte[0]
        $nom=$tabCompte[1]
        $displayname="$prenom $nom"
		$init=$prenom.Substring(0,1)
        $login=$init+$nom
        $loginComplet="$login@$sousDomaine.$domaineParent"     
        $HomeDirectory=$dossierData+$login

        #A complèter : Ajout du compte avec toutes les informations, activation, etc.. 
        New-ADUser -Path "OU=$unite,$domaineAD" -Name $login -userPrincipalName $loginComplet -sAMAccountName $login `
        -GivenName $prenom -Surname $nom -DisplayName $displayname -AccountPassword $secret -ChangePasswordAtLogon $true `
        -Enabled $true -scriptPath $scriptPath -HomeDrive $HomeDrive -HomeDirectory $HomeDirectory
			
     
		# A complèter : ajout du compte dans le groupe
        Add-ADGroupMember -Identity $groupe -Members $login

		#A complèter : création du dossier personnel
        New-Item $HomeDirectory -ItemType Directory
		
		#Définition des droits sur le dossier personnel
        $perm=$login+":F"
        cacls $HomeDirectory /T /E /C /G $perm
		
		$nbcompte++
}

Write-Host "nombre de comptes créés : $nbcompte"
 