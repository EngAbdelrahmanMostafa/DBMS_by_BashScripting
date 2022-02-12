#!/bin/bash

#Modify Database Name 
echo "Available DataBases"
ls  data
read -p "Enter DataBase Name: t you want to rename : " dbold

if [[ -d data/$dbold ]]
then
	echo "DataBase  $dbold Exists "
	read -p "Enter New Name: " dbnew
	mv data/$dbold data/$dbnew
	echo " Rename Done Successfully "
else
	echo "No database exist with this name !!!"
fi
