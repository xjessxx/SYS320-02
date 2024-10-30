
file="/var/log/apache2/access.log"

allLogs=""

function getAllLogs(){
allLogs=$(cat "$file" | cut -d' ' -f1,4,7 | tr -d "[")
}

function ips(){
ipsAddressed=$(echo "$allLogs" | cut -d' ' -f1)
}

function pageCount(){
pageCounts=$(cut -d' ' -f7 "$file" | sort | uniq -c | sort -nr)
}
getAllLogs
ips
pageCount
echo "$pageCounts"
