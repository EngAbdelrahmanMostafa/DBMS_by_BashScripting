#!/bin/bash
#### droping Table
source ../.././GlobalVars.sh
cd tables
result=${PWD##*/}
cd ../
if [ "$( ls -A tables )" ]; then
bash ../../TablesScripts/./listTables.sh
read -p "${GREEN} Enter table Name: ${NC}" dropt
if [[ -f tables/$dropt.csv ]]; then
	echo "${RED}Are you Sure You Want To drop $dropt table?${NC} ${CYAN} y/n ${NC} "
	read choice;
	case $choice in
		 [Yy]* )
			rm tables/$dropt.csv
			rm metaData/$dropt.metaData
			echo "${GREEN} $dropt has been deleted ${NC}"
			;;
		 [Nn]* )
			echo "${GREEN} Operation Canceled ${NC}"
			;;
		* )
			echo "${RED} Invalid Input 0 tables effected ${NC}"
			;;
	esac
else
	echo "${RED} $dropt doesn't exist ${NC}"
fi
else echo "${RED}there are no avialable tables to drop${NC}"
fi
