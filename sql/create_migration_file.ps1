# Allow to create a new migration file with the correct tag name for migration
# $version should be use to update a migration step
# prefix should be use to choise between R or V
Param(
    [string]$version,
    [string]$prefix
)
# Version
if ($version.length -eq 1) {
    $fichiers = Get-ChildItem data/$prefix$version*.sql
    $elem = @() 
    foreach ($i in $fichiers) {
        $elem += $i.name.split('_')[1]
    }
    $elem = $elem | sort -descending
    if ($elem.length -gt 0) {
        $new_v = [int]$elem[0] + 1
    } else {
        $new_v = 1        
    }
} else {
    $fichiers = Get-ChildItem data/v*.sql
    $elem = @() 
    foreach ($i in $fichiers) {
        $elem += $i.name.split('_')[0].split($prefix)[1]
    }
    $elem = $elem | sort -descending
    if ($elem.length -gt 0) {
        $new_v = [int]$elem[0] + 1
    } else {
        $new_v = 1        
    }
}
# Description
$desc = Read-Host -Prompt "Description du nouveau fichier"
$desc = $desc.ToLower()
$fname = $desc
if ($desc.split(' ').length -gt 1) {
    $fname = ""
    $desc = $desc.split(' ')
    for ($i=0;$i -le  $desc.length;$i++) {
        Write-Output $desc[$i].length
        if ($desc[$i].length -gt 0) {
            if ($fname.length -gt 0 -and $fname[$fname.length-1] -ne "_") {
                $fname +='_'
            }
            $fname += $desc[$i]
        }
    }
}
if ($version.length -eq 1) {
    $fname = "data/" + $prefix + $version + '_' + $new_v + "_" + $fname +'.sql'
} else {
    $fname = "data/" + $prefix + $new_v + '_1__' + $fname + '.sql' 
}
New-item  $fname
Write-Output "Fichier créer : " + $fname 


