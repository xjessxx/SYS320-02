link="127.0.0.1/IOC-1.html"

curlpage=$(curl -sL "$link")
echo "$curlpage" | awk -F'<?td>' '/<tr>/ {getline ; print $2}' > IOC.txt
