echo "File was accessed on $(date)" >> fileaccesslog.txt

echo "To: jessica.mcilree@mymail.champlain.edu" > accessemail.txt
echo "Subject: file access" >> accessemail.txt
cat fileaccesslog.txt >> accessemail.txt
cat accessemail.txt | ssmtp jessica.mcilree@mymail.champlain.edu
