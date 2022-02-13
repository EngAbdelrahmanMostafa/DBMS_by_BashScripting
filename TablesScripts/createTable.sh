#!/bin/bash
source ./colors_script.sh

#create table with name that user entered

echo "====================== Create Table ======================\n";

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

echo -e "\n${CYAN}Pay Attenyion, First Column must be the PRIMARY KEY !!${NC}\n";

typeset -i i;
declare -a columnsName;
declare -a columnsDT;
for (( i = 1; i <= columnNumber; i++ )); do

                #Check Column Name Validation

      while true; do

          read -p "${YELLOW}Enter Column's No.$i Name: ${NC}" colName;

          if [[ -z $colName ]]; then
                echo "${RED}Empty Input !!, Please try again ${NC}";

          elif [[ $colName =~ ['!@#$%^&*()+=-'] ]]; then
                echo "${RED}Invalid input !! , Please try again${NC}";

          else
                break;
          fi
      done
      columnsName[$i]=$colName;

      read -p "${YELLOW}Enter DataType of '$colName'${NC}[string/int]: " colDataType;

      while [[ $colDataType != int && $colDataType != string ]]; do

            read -p "${RED}Invalid DataType !!,${NC}${CYAN}Select string or int: ${NC}" colDataType;
      done

      columnsDT[$i]=$colDataType;

      if [[ i -eq $columnNumber ]] ; then
              echo 	"$colName" >> tables/$tableName.csv
      else
              echo -n "$colName,"  >> tables/$tableName.csv
      fi
  done

  printf "Table Name: tableName\nColumns No.: $columnNumber\nTables Columns: ${columnsName[*]}\nColumns DataType: ${columnsDT[*]}\nPK of the Table: ${columnsName[1]}" >> metaData/$tableName.metaData;

fi

echo -e "\n${GREEN}The Table Created Successfully${NC} ^__^";
echo -e "\n================================================================================\n";
