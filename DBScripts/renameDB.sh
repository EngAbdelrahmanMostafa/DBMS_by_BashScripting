#!/bin/bash

#Modify Database Name 

read -p "Enter DataBase Name: " dbold

if [[ -d data/$dbold ]]
then
	echo " $dbold is Exist "
	read -p "Enter New Name: " dbnew
	mv data/$dbold data/$dbnew
	echo " Rename Done Successfully "
else
	echo "No database exist with this name !!!"
fi
