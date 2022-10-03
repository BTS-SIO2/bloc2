#recherche ligne par ligne d'une chaine dans un fichier texte
#affiche un message à chaque fois

$fichier="c:\TpPowershell\audit.log"

#$recherche=Read-Host "Saisir une information : "

$recherche =  "erreur"

if (Test-Path $fichier){
    $colLIgnes=Get-Content $fichier

    foreach($ligne in $colLignes){

        if ($ligne.Contains($recherche)){
            Write-Host "$recherche est trouvé"
        }
    }

}

else{
    Write-Host "Fichier $fichier non trouvé"
}

