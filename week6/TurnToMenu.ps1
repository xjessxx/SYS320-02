.(Join-Path $PSScriptRoot Users.ps1)
.(Join-Path $PSScriptRoot Apache-Logs.ps1)

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display last 10 apache logs`n"
$Prompt += "2 - Display last 10 failed logins`n"
$Prompt += "3 - Display at risk users`n"
$Prompt += "4 - Open Champlain.edu`n"
$Prompt += "5 - Exit`n"

$operation = $true

while($operation){

    Write-Host $Prompt | Out-String
    $choice = Read-Host

    if($choice -eq 5){
    exit
    $operation = $false
    }

     elseif($choice -eq 1){
#display last ten apache logs
Get-Content "C:\xampp\apache\logs\access.log" -Tail 10
$opertation = $false
}

elseif($choice -eq 2){
$failedLogins = getFailedLogins(10)
$lastTenFailedLogins = $failedLogins | Select-Object -Last 10
Write-Host $lastTenFailedLogins
}

elseif($choice -eq 3){
$timeBack = Read-Host -Prompt "Please enter the number of days of failed log ins"

$failedUserLogins = getFailedLogins $timeBack

$failedUserLogins

Write-Host ($failedUserLogins | Where-Object { $_.failedLogins -gt 10} | Format-Table | Out-String)
}

    elseif($choicem-eq 4){
    $chrome = "chrome"
    $chromecheck = Get-Process -Name $chrome -ErrorAction SilentlyContinue
    if($chromecheck)
    {
    Stop-Process -Name $chrome -Force
    }else{
    Start-Process "chrome.exe" "https://www.champlain.edu"
}
    }

    else {
         Write-Host "Enter a number 1-5"
         $operation = $true
    }
}
