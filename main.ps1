. (Join-Path $PSScriptRoot functionseventslogs.ps1)

clear

#Get login and logoffs from the last 14 days
$loginoutsTable = customTable -numDays $numDays
$loginoutsTable

#get startup and shutdowns from last 14 days
$shutdownstartupTable = startAndShut -numDays $numDays
$shutdownstartupTable