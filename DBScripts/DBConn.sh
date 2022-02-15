#!/bin/bash
# make a connecion to a specific database
source ./GlobalVars.sh
echo -e "\n============================ Connect to Database ==========================\n";
DBScripts/./listDB.sh
flag=true;
while ${flag} ; do
read -p "${GREEN}which database do you want to connect to: ${NC}" DataBaseName
if [[ -d data/${DataBaseName} ]];then
flag=false;
cd data/${DataBaseName}
echo " ${CYAN} You are now conected to ${DataBaseName} ${NC}"

PS3="${GREEN} what do you want to execute on your database ${NC} "
select i in "Create Table" "List Tables" "Drop Table" "Insert into Table" "Select from Table " "Delete From Table " "
update value in a row " " go back to home" "Exit!"
do
  case ${REPLY} in
  1)  ../../TablesScripts/./createTable.sh;;
  2)  ../../TablesScripts/./listTables.sh;;
  3)  ../../TablesScripts/./dropTable.sh;;
  4)  ../../TablesScripts/./InsertIntoTable.sh;;
  5)  ../../TablesScripts/./selectFromTable.sh;;
  6)  ../../TablesScripts/./deleteFromTable.sh;;
  7)  ../../TablesScripts/./updateRowValue.sh;;
  8)  cd ../../ ;
      ./HomeMenu.sh;
      break; ;;
  9)  cd ../../ ;
      exit;;
  esac
done
else
echo "${RED} sorry this DataBase Doesn't exist ${NC}"
fi
done
