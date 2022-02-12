#!/bin/bash 
# make a connecion to a specific database
echo which database do you want to connect to:
echo "Available DataBases"
ls  data
read DataBaseName  
if [[ -d data/${DataBaseName} ]];
cd data/${DataBaseName}
then echo " You are now conected to ${DataBaseName} " 
PS3="what do you want to execute on your table "
select i in "Create Table" "List Tables" "Drop Table" "Insert into Table" "Select from Table " "Delete From Table " " go back to home" "Exit!"
do
  case ${REPLY} in
  1)  echo ok1;;
  2)  echo ok2;;
  3)  echo ok3;;
  4)  echo ok4;;
  5)  echo ok5;;
  6)  echo ok6;;
  7)  ../.././HomeMenu.sh ;;
  8) exit;;
  esac
done
else
echo "sorry this DataBase Doesn't exist"
fi
