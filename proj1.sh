#!/bin/sh
#if [ "$#" -ne 2 ];then #Error checking for number of args
#	echo "Illegal number of parameters"
#	exit 2
#fi

ROOT='/home'
OUT='filetree.html'
DIRECT=$(ls -ld $1)
RES=$(echo "$DIRECT" | grep -c "r") 
if [ "$RES" -lt 1 ]; then #Error checking to see if directory is readable
	echo "Directory is not readable"
	exit 2
fi

TOP=$(ls -R1 $ROOT) #I Think this is the right way to go
echo "$TOP" > myres.txt
touch $OUT
text2html --pre myres.txt > $OUT

