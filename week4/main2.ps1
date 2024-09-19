. (Join-Path $PSScriptRoot Apache-Logs.ps1)
. (Join-Path $PSScriptRoot WindowsApacheLogs.ps1)
. (Join-Path $PSScriptRoot ParsingApache.ps1)

$page = Get-Content C:\xampp\apache\logs\access.log | `
Select-String -Pattern '"GET\s+([^ ]+)' | ForEach-Object {$_.Matches.Groups[1].Value}

$httpCode = Get-Content C:\xampp\apache\logs\access.log | `
Select-String -Pattern '\b[0-9]{3}\b'

$webName = Get-Content C:\xampp\apache\logs\access.log | `
Select-String '\"[^\"]+\"\s+\"([^\"]+)$'

$Address = apacheLogs -pageVisited $page -httpCode $httpCode -webName $webName
$Address


