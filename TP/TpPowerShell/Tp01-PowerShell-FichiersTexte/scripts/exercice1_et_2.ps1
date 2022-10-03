# Script qui affiche les données du fichier exo1.txt
# Le nombre de noms doit être affiché à la fin
# Avec test d'existence du fichier

$fichier="exo1.txt"

if (Test-Path $fichier){
    $colLIgnes=Get-Content $fichier
    $cpt=0
    foreach($ligne in $colLignes){
        $tabCompte=$ligne.Split(";")
        Write-Host "Nom : "  $tabCompte[0] " Prénom : " $tabCompte[1]
        $cpt++
    }

    Write-Host "Nombre de nom(s) : $cpt"
}

else{
    Write-Host "Fichier $fichier non trouvé"
}
