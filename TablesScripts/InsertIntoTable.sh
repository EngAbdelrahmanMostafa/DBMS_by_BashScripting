#!/bin/bash
#import
source ../.././GlobalVars.sh


OUT=''
joinByChar() {
  local IFS="$1"
  shift
   OUT=$*
}

echo -e "\n====================== Insert Into Table ======================\n";
while true ; do
bash ../../TablesScripts/./listTables.sh
read -p "${CYAN} press q to exit or ${NC} ${YELLOW}Enter Table Name you want to insert into: ${NC}" tableName;
file='tables/'$tableName'.csv';
mfile='metaData/'$tableName'.metaData'
if [[ ${tableName} == 'q' ]]; then
  break;
fi
if [[ -f $file ]]; then
  count=`awk -F" " '{if(NR==2) {print $2}}' $mfile`

  #colname=`head -1 $file `

  for (( i = 1; i<=$count ; i++ )); do
   TypeArr[$i]=`cut -f 2- -d' ' $mfile | awk -F" " -v "i=$i" '{if(NR==4) {print $i}}' `
   headers[$i]=`cut -f 2- -d' ' $mfile | awk -F" " -v "i=$i" '{if(NR==3) {print $i}}' `
  done

  #IFS=', ' read -r -a headers <<< "$colname"

  for (( i = 1; i<=$count ; i++ )); do
    while true ; do
    read -p "please Enter your ${headers[i]} : " answer[i]
    if [[ ${TypeArr[i]} =~ 'int' ]]; then
      checkInteger ${answer[i]}
      if [[ $? == 0 ]]; then
        break;
      else
          echo "Not valid input Data type"
      fi
    elif [[ ${TypeArr[i]} =~ 'string' ]]; then
      checkString ${answer[i]}
      if [[ $? == 0 ]]; then
        break;
      else
          echo "Not valid input Data type"
      fi
    fi
    done
  done
joinByChar , ${answer[@]}
echo $OUT >> $file
if [[ $? == 0 ]]; then
echo "${GREEN}your input is commited successfully ${NC}"
break;
else
  echo "${RED} your input is faced an error please try again ${NC}"
fi
else
  echo "${RED}your table doesnot Exist ${NC}"
fi
done
