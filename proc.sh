#!/bin/sh

#echo "made it"

DASH='-----------------------------------------------------'

op_system_info(){
	echo "$DASH"
	#HEAD=$'System Information'
	echo " System Information"
	echo "$DASH"
	echo "Operating sytem : $(uname)"
	echo "$(/usr/bin/lsb_release -a)"
	read -p 'Press [Enter] key to continue...' Val
	echo 
}

hostname_dns() {
	echo "$DASH"
	echo " Hostname and DNS information"
	echo "$DASH"
	echo "Hostname: $(hostname)"
	echo "DNS domain : $(hostname -d)"
	echo "Fully qualified domain name : $(hostname --fqdn)"
	echo "Network address (IP) : $(ip address | grep -w 127)"
	echo "DNS name servers (DNS IP) : $(grep nameserver /etc/resolv.conf)"
	read -p 'Press [Enter] key to continue...' Val
	echo
}

network_info() {
	echo "$DASH"
	echo " Network Information"
	echo "$DASH"
	echo "Total network interfaces found: $(ls -A /sys/class/net/ | wc -l)"
	echo "*** IP Addresses Informatioin ***"
	echo "$(ip address | grep -v link)"
	echo $'***********************\n*** Network routing ***\n***********************'
	echo "$(netstat -r)"
	echo $'*************************************\n*** Interface traffic information ***\n*************************************'
	echo "$(netstat -i)"
	read -p 'Press [Enter] key to continue...' Val
	echo
}

online() {
	echo "$DASH"
	echo " Who is online"
	echo "$DASH"
	echo $'NAME\tLINE\t\tTIME\t\tCOMMENT'
	echo "$(who)"
	read -p 'Press [Enter] key to continue...' Val
	echo
}

last_logged() {
	echo "$DASH"
	echo " List of last logged in users"
	echo "$DASH"
	#echo "$(last)"
	echo "$(last | grep -v reboot)"
	read -p 'Press [Enter] key to continue...' Val
	echo
}


ip_address(){
	echo "$DASH"
	echo " Public IP Information"
	echo "$DASH"
	echo $(dig +short myip.opendns.com @resolver1.opendns.com)
	read -p 'Press [Enter] key to continue...' Val
	echo
}

disk_usage() {
	echo "$DASH"
	echo " Disk Usage Info"
	echo "$DASH"
	echo "$(df -h | awk 'NR>1 {print $5, $6}')"
	read -p 'Press [Enter] key to continue...' Val
	echo
}

filetree() {
	echo "$DASH"
	echo "Filetree"
	echo "$DASH"
	./proj1.sh
	echo "filetree.html created"
	read -p 'Press [Enter] key to continue...' Val
	echo
}

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
	1)
	op_system_info ;;
	2)
	hostname_dns ;;
	3)
	network_info ;;
	4)
	online ;;
	5)
	last_logged ;;
	6)
	ip_address ;;
	7)
	disk_usage ;;
	8)
	filetree ;;
	9)
	process_op ;;
	*)
	echo "no hit in case" ;;
esac
