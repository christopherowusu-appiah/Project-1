$csv = Import-Csv -Path C:\Users\azadmin\Documents\Activity\choco\chocoactivity.csv
foreach ($package in $Csv) {
choco uninstall -y $package.name
Write-Output $package.name removed!
}
