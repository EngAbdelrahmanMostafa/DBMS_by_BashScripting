#!/bin/bash

#create database directory with name sent by user

read -p "Enter DB Name: " var	

if [[ -d data/$var ]] 
then
	echo "The Database $var is Already Exists";
else
	mkdir data/$var
fi
