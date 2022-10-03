#recherche ligne par ligne d'une chaine dans un fichier texte
#affiche le nombre de fois à la fin de la recherche

$fichier="c:\TpPowershell\audit.log"

#$recherche=Read-Host "Saisir une information : "

$recherche =  "erreur"

if (Test-Path $fichier){
    $colLIgnes=Get-Content $fichier
    $cpt=0

    foreach($ligne in $colLignes){   
        
        if ($ligne.Contains($recherche)){
            $cpt++
        }
    }

    Write-Host "$recherche est trouvé $cpt fois"
}

else{
    Write-Host "Fichier $fichier non trouvé"
}

