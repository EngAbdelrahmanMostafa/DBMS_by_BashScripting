#! /bin/bash
# dataBase Home Menu
echo "Welcome To The DBMS"
PS3="what is the action you want to perform on the data base "
	select i in "Create DataBase" "List DataBases " "Connect to DataBase"  "Rename DataBase" "Drop Data Base" " Sign Out!"
	do
	  case ${REPLY} in
	  1) DBScripts/./createDB.sh ;;
	  2) DBScripts/./listDB.sh ;;
    3) DBScripts/./DBConn.sh ;;
    4) DBScripts/./renameDB.sh ;;
	  5) DBScripts/./DBDrop.sh ;;
	  6) break; ;;

	  esac
		exit;
	done
