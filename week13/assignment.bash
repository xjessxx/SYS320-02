#!/bin/bash

# This is the link we will scrape
link="10.0.17.30/Assignment.html"

fullPage=$(curl -sL "$link")

# recieved help from tutoring center
temp=( $( \
echo "$fullPage" | \
xmllint --xpath "//table[@id='temp']//td" - | \
awk -F "[><]" '{print $3}'
) )

pres=( $( \
echo "$fullPage" | \
xmllint --xpath "//table[@id='press']//td" - | \
awk -F "[><]" '{print $3}'

) )

for ((i=0; i<"${#temp[@]}"; i+=2)) {
echo "${pres[$i]}  ${temp[$i]}  ${temp[$i+1]}"
} 
