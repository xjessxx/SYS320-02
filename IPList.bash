#!bin/bash

#List all ips in a given network prefix
#/24 only

[ "$#" -ne 1 ] && echo "Usage: $0 <Prefix>" && exit 1

#first input taken
prefix=$1

#verify input length
[ "${#prefix}" -le 5 ] && \
printf "Prefix length is too short\nPrefix example: 10.0.17\n" && \
exit 1

for i in {1..254}
do
	ping -c 1 "$prefix.$i" | grep "64 bytes from" | \
	grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
done
