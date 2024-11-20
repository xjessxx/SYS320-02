#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
echo "$dateAndUser" 
}

function getFailedLogins(){
logline=$(cat "$authfile" | grep "lightdm"| grep "fail")
dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
echo "$dateAndUser" 
}

function Logins(){
# Sending logins as email - Do not forget to change email address
# to your own email address
echo "To: jessica.mcilree@mymail.champlain.edu" > emailform.txt
echo "Subject: Logins" >> emailform.txt
getLogins >> emailform.txt
cat emailform.txt | ssmtp jessica.mcilree@mymail.champlain.edu
}

function fails(){
# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email 
echo "To: jessica.mcilree@mymail.champlain.edu" > emailform.txt
echo "Subject: failed logins" >> emailform.txt
echo "$(getFailedLogins)" >> emailform.txt
cat emailform.txt | ssmtp jessica.mcilree@mymail.champlain.edu
}
Logins
fails
