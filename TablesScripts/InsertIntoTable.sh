#!/bin/bash
#import
source .././GlobalVars.sh


OUT=''
joinByChar() {
  local IFS="$1"
  shift
   OUT=$*
}

echo -e "\n====================== Insert Into Table ======================\n";

read -p "${YELLOW}Enter Table Name you want to insert into: ${NC}" tableName;
file='tables/'$tableName'.csv';
mfile='metaData/'$tableName'.metaData'

if [[ -f $file ]]; then
  count=`awk -F" " '{if(NR==2) {print $2}}' $mfile`
  echo "count $count"
  #colname=`head -1 $file `

  for (( i = 1; i<=$count ; i++ )); do
   TypeArr[$i]=`cut -f 2- -d' ' $mfile | awk -F" " -v "i=$i" '{if(NR==4) {print $i}}' `
   headers[$i]=`cut -f 2- -d' ' $mfile | awk -F" " -v "i=$i" '{if(NR==3) {print $i}}' `
  done
  echo "${TypeArr[@]}"
echo "${headers[@]}"
  #IFS=', ' read -r -a headers <<< "$colname"

  for (( i = 1; i<=$count ; i++ )); do
    while true ; do
    read -p "please Enter your ${headers[i]} : " answer[i]
    echo ${TypeArr[1]}
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

else
  echo your table doesnot Exist
fi
