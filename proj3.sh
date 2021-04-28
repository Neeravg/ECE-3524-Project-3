#!/bin/sh

Main=$'----------------------------\nMain Menu\n----------------------------\n1. Operating system info\n2. Hostname and DNS info\n3. Network info\n4. Who is online\n5. Last logged in users\n6. My IP address\n7. My disk usage\n8. My home file-tree\n9. File operations\n10. Exit'

I=0

while [ $I -ne 10 ]
do
	#echo Number: $I
	#curDate=$(date)
	echo $(date -u)
	echo "$Main"
	read -p "Enter your choice [ 1 - 10 ] " I


	if [ $I -lt 10 ] && [ $I -gt 0 ]
	then
		./proc.sh "$I"
	else
		echo ""
		#echo $'Invalid Input\n\n'
	fi


done
