#!/bin/bash
#Database Drop
source ./GlobalVars.sh
echo -e "\n============================== Drop Database =================================\n";
if [[ -z "$(ls -A  data)" ]] ;
then
echo "${RED}sorry there is no datbases to drop ${NC}"
else
DBScripts/./listDB.sh
while true ; do

read -p "${GREEN}Enter the Name of the  DataBase You want to Drop : ${NC}" DBDname
if [[ -d data/$DBDname && $DBDname != "" ]];
then
echo "${CYAN}Are You Sure To Drop $DBDname DataBase? Y/N? ${NC}"
read Ans
case $Ans in
	[yY] )
	     	rm -r data/$DBDname
		echo "${GREEN} $DBDname has been removed ${NC}"
		break;
		;;
	[Nn] )
		echo "${GREEN} $DBDname still exist no change is commited ${NC}"
		break;
		;;
	*)
		echo "${RED}invalid choice Aborting...${NC}"
		break;
		;;
esac
else
echo "${RED} Data base $DBDname does not exist please try again ${NC}"
fi
done
fi
