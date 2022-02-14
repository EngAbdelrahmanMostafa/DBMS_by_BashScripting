#!/bin/bash
#### droping Table
source .././GlobalVars.sh
cd tables
result=${PWD##*/}
if [ "$( ls -A )" ]; then
echo "${CYAN} available tables in db ${result} ${NC}"
ls
read -p "Enter table Name: " dropt
if [[ -f $dropt.csv ]]; then
	echo "${RED}Are you Sure You Want To drop $dropt table?${NC} ${CYAN} y/n ${NC} "
	read choice;
	case $choice in
		 [Yy]* )
			rm $dropt.csv
			rm ../metaData/$dropt.metaData
			echo "$dropt has been deleted"
			;;
		 [Nn]* )
			echo "Operation Canceled"
			;;
		* )
			echo "Invalid Input 0 tables effected"
			;;
	esac
else
	echo "$dropt doesn't exist"
fi
else echo "${RED}there are no avialable tables to drop${NC}"
fi
