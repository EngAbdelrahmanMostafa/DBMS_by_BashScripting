#!/bin/bash
####list avilable tables
source ../.././GlobalVars.sh
echo -e "\n${CYAN}============================== Existing Tables =================================${NC}";

if [[ -d "tables" ]]; then
	ls tables | awk -F"." '{print  "Table "NR": " $1 }'|awk -F"." '{{print $1}}';

fi
echo -e "${CYAN}================================================================================${NC}\n";
