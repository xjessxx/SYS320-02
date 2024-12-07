#take two inputs
logFile="$1"
iocFile="$2"

cat "$logFile" | egrep -i -f "$iocFile" | cut -d' ' -f1,4,7 | tr -d '[' > report.txt
