#!/bin/bash

#List DataBases exist in your DBMS

if [[ -d data ]]
then
	ls data | awk '{print  "DB "NR": " $1 }'
fi
