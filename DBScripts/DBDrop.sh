#!/bin/bash 
#Database Drop
if [ -z "$(ls -A  ~/DBMSDir)" ];
then 
echo "sorry there is no datbases to drop"
else
echo "Available DataBases"
ls  ~/DBMSDir/
read -p "Enter the Name of the  DataBase You want to Drop : " DBDname
if [[ -d ~/DBMSDir/$DBDname && $DBDname != "" ]];
then 
echo "Are You Sure To Drop $DBDname DataBase? Y/N?"
read Ans
case $Ans in 
	[yY] )
	     	rm -r ~/DBMSDir/$DBDname
		echo "$DBDname has been removed"
		;;
	[Nn] )
		echo "$DBDname still exist no change is commited"
		;;
	*)
		echo "invalid choice Aborting..."
		;;
esac
else
echo "Data base $DBDname does not exist "
fi
fi
