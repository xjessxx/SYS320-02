<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations.
*************************************************************
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}

function checkPassword {
param(
[String]$password
)
$operation = $true

while($operation){
if($password.Length -ge 6){
Write-Host "The password is too short"
return $false;
$operation = $false
}
if($password -notmatch '[^a-zA-Z0-9]'){
Write-Host "the password needs a special character, number and letter"
return false
$operation = $false;
}
else{
return $true;
$operation = $true
}
}
}
