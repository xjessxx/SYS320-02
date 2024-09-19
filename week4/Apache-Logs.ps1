function apacheLogs([string]$page, [int]$httpCode, [string]$webName){
$ipAddress = $FilteredData | Select-Object -ExpandProperty IPAddress
return $ipAddress
}
