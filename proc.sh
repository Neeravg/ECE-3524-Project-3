#!/bin/sh

#echo "made it"



process_op() {
	echo "$DASH"
	echo "Process Operations"
	echo "$DASH"
	echo $'(please enter the number of your selection below)\n'
	
	I=0
	Submenu=$'1. Show all processes\n2. Kill a process\n3. Bring up top\n4. Return to Main Menu'
	while [ $I -ne 4 ]
	do
		echo "$Submenu"
		echo
		read -p "" I
		
		case $I in
			1)
			ps -efj
			#ps -efj | awk '{print $1, $2, $3, $6, $7, $8, $9, $10}';;
			echo ;;
			2)
			echo "Please enter the PID of the process you would like to kill:" 
			read -p "" pid
			kill -9 $pid
			echo "Killed: $pid" ;;
			3)
			#echo $(top)
			top 
			echo ;;
			#echo "made it after" ;;
		esac
	done
	
	#read -p 'Press [Enter] key to continue...' Val
	echo
}


#echo "First Arg: $1"

case $1 in 
	9)
	process_op ;;
	*)
	echo "no hit in case" ;;
esac
