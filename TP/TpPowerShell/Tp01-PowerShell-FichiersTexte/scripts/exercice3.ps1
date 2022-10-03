# script qui demande à l’utilisateur une information
# enregistre cette information et la date de saisie dans un fichier nommé test2.log

$fichier = "C:\TpPowerShell\test2.log"
$date=get-date -Format "dd/MM/yyyy"

$reponse=Read-Host "Saisir une information : "

Add-Content $fichier $date
Add-Content $fichier $reponse

# autre solution sur 1 ligne : Add-Content $fichier "$date $reponse"

