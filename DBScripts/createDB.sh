#!/bin/bash
source ./colors_script.sh
#create database directory with name sent by user

read -p "${YELLOW}Enter DB Name:${NC} " var

if [[ -z $var ]]; then
 	echo "${RED}Empty Input !!, Please try again ${NC}";
	source ./createDB.sh;

elif [[ $var =~ ['!@#$%^&*()+=-'] ]]; then
	echo "${RED}Invalid input !! , Please try again${NC}";
	source ./createDB.sh;

elif [[ -d data/$var ]]; then
	echo "${RED}The Database${NC} $var ${RED}is Already Exists${NC}";
	source ./createDB.sh;

else
	mkdir data/$var
	echo "${GREEN}The Database Created Successfully${NC}";
fi

echo -e " \n*================================================================================* ";
