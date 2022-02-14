#! /bin/bash
# dataBase Home Menu 
echo "Welcome To The DBMS"
PS3="what is the action you want to perform on the data base "
	select i in "Create DataBase" "List DataBases " "Connect to DataBase"  "Rename DataBase" "Drop Data Base" " Sign Out!"
	do
	  case ${REPLY} in
	  1) ./createDB.sh ;;
	  2) ./listDB.sh ;;
          3) ./DBConn.sh ;;
          4) ./renameDB.sh ;;
	  5) ./DBDrop.sh ;;
	  6) exit ;;
	  
	  esac
	done
