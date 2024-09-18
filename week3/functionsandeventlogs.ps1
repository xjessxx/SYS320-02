Get-EventLog System -source Microsoft-Windows-WinLogon

$numDays = Read-Host "Enter the number of days";
function customTable{
param ([int]$numDays)

$loginouts = Get-EventLog system -source Microsoft-Windows-WinLogon -After (Get-Date).AddDays(-$numDays)

$loginoutsTable = @() #empty array for custom fill
for($i=0; $i -lt $loginouts.Count; $i++){

#create event property value
$event = ""
if($loginouts[$i].InstanceID -eq 7001) {$event = "Logon"}
if($loginouts[$i].InstanceID -eq 7002) {$event = "Logoff"}

#create user property value
$user = $loginouts[$i].ReplacementStrings[1]


#add each new line to empty array
$loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated; `
                                       "Id" = $loginouts[$i].EventId; `
                                        "Event" = $event; `
                                         "User" = $user;
                                         }
} #end of four
$loginoutsTable

for($i = 0; $i -lt $loginouts.Count; $i++){
$SID = New-Object System.Security.Principal.SecurityIdentifier($loginoutsTable[$i].User)

$loginoutsTable[$i].User = $SID.Translate([System.Security.Principal.NTAccount])
}
$loginoutsTable
}

customTable($numDays);

function startAndShut {
param([int]$numDays)
$events = Get-EventLog system -After (Get-Date).AddDays(-$numDays) | Where-Object { $_.EventID -in 6005, 6006 }

$startonoffsTable = @() #empty array for custom fill
foreach($event in $events){
#create event property value
$customEvent = ""
if($event.EventID -eq 6006) {$customEvent = "shut-down"}
if($event.EventID -eq 6005) {$customEvent = "startup"}


#add each new line to empty array
$startonoffsTable += [pscustomobject]@{"Time" = $event.TimeGenerated; `
                                       "Id" = $event.EventId; `
                                        "Event" = $customEvent; `
                                         "User" = "system";
                                         }
} #end of four
 return $startonoffsTable
}

startAndShut -numDays $numDays


