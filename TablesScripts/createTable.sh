#!/bin/bash
source ./colors_script.sh

#create table with name that user entered

mkdir tables 2>> /dev/null
mkdir metaData 2>> /dev/null

read -p "${YELLOW}Enter table's Name: ${NC}" tableName;

                #Check table Name Validation

if [[ -z $tableName.csv ]]; then
      echo "${RED}Empty Input !!, Please try again ${NC}";
      bash ./createTable.sh

elif [[ $tableName =~ ['!@#$%^&*()+=-'] ]]; then
      echo "${RED}Invalid input !! , Please try again${NC}";
      bash ./createTable.sh;

elif [[ -f $tableName.csv ]]; then
      echo "${RED} $tableName is already exist !! , Please try again ${NC}";
      bash ./createTable.sh;

else
          touch tables/$tableName.csv
          touch metaData/$tableName.metaData

          while true
          do

          read -p "${YELLOW}Enter the number of columns: ${NC}" columnNumber;

                #Check Number of Columns Validation

                if [[ $columnNumber =~ [^1-9] ]]; then
                    echo "${RED}At Least needed 1 Column, Please try again${NC}";

                elif [[ -z $columnNumber ]]; then
                    echo "${RED}Empty Input !!, Please try again ${NC}";

                else
                    break;
                fi
          done

echo -e "${CYAN}Pay Attenyion, First Column must be the PRIMARY KEY${NC}\n";

typeset -i i;
for (( i = 1; i <= columnNumber; i++ )); do

                #Check Column Name Validation

      while true; do

          read -p "${YELLOW}Enter Column No.$i's Name: ${NC}" colName;

          if [[ -z $colName ]]; then
                echo "${RED}Empty Input !!, Please try again ${NC}";

          elif [[ $colName =~ ['!@#$%^&*()+=-'] ]]; then
                echo "${RED}Invalid input !! , Please try again${NC}";

          else
                break;
          fi
      done

      read -p "${YELLOW}Enter DataType of '$colName'${NC}[string/int]: " colDataType;

      while [[ $colName != int && $colName != string ]]; do

            read -p "${RED}Invalid DataType !!,${NC}${CYAN}Select string or int: ${NC}" colDataType;
      done
  done
fi
