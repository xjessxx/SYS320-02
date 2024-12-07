#print tags to beggining of file
echo "<html>" >> report.html
echo "<h1>Access logs with IOC indicators:</h1>" >> report.html
echo "<body>" >> report.html
echo "<table style='border: 2px solid;'>" >> report.html

while IFS= read -r line; do

echo "<tr>" >> report.html

for content in $line; do

echo "<td style='border: 1px solid;'>$content</td>" >> report.html
done
echo "</tr>" >> report.html

done < report.txt

#print tags to end of file
echo "</table>" >>report.html
echo "</body>" >> report.html
echo "</html>" >> report.html

mv report.html /var/www/html/
