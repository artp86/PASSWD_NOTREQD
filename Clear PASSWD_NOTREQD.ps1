Import-Module ActiveDirectory

# Chemin vers le fichier CSV d'entrée (à adapter)
$csvPath = "C:\Users\Administrator\Documents\Book1.csv"

$computers = Import-Csv -Path $csvPath

foreach ($computerEntry in $computers) {
    try {
        # Récupère le nom de l'ordinateur depuis le CSV (colonne "Name" par défaut)
        $computerName = $computerEntry.Name
        
        $computer = Get-ADComputer -Identity $computerName -Properties userAccountControl -ErrorAction Stop
        
        # Valeur actuelle de userAccountControl
        $currentUAC = $computer.userAccountControl
        
        # Désactive le flag "Password not required"
        $newUAC = $currentUAC -band (-bnot 32)
        
        Set-ADObject -Identity $computer.DistinguishedName -Replace @{userAccountControl = $newUAC}
        
        Write-Host "[SUCCÈS] $computerName - Flag supprimé"
    }
    catch {
        Write-Host "[ERREUR] $($computerEntry.Name) - $_" -ForegroundColor Red
    }
}

Write-Host "Traitement terminé"
