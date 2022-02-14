#!/bin/bash
# make a connecion to a specific database
echo which database do you want to connect to:
echo "Available DataBases"
ls  data
read DataBaseName
if [[ -d ../data/${DataBaseName} ]];
cd ../data/${DataBaseName}
then echo " You are now conected to ${DataBaseName} "
PS3="what do you want to execute on your table "
select i in "Create Table" "List Tables" "Drop Table" "Insert into Table" "Select from Table " "Delete From Table " " go back to home" "Exit!"
do
  case ${REPLY} in
  1)  ../../TablesScripts/./createTable.sh;;
  2)  ../../TablesScripts/./listTables.sh;;
  3)  ../../TablesScripts/./dropTable.sh;;
  4)  ../../TablesScripts/./InsertIntoTable.sh;;
  5)  ../../TablesScripts/./selectFromTable.sh;;
  6)  ../../TablesScripts/./deleteFromTable.sh;;
  7)  cd ../../ ;
      ./HomeMenu.sh ;;
  8)  cd ../../ ;
      exit;;
  esac
done
else
echo "sorry this DataBase Doesn't exist"
fi
