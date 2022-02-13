  #!/bin/bash
#import
source ./colors_script.sh

function join_by {
  local d=${1-} f=${2-}
  if shift 2; then
    printf %s "$f" "${@/#/$d}"
  fi
}
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
  count=` head -1 $file | sed 's/[^,]//g' | wc -c `
  colname=`head -1 $file `
  IFS=', ' read -r -a headers <<< "$colname"
  i=0;
  for element in "${headers[@]}"
  do
    echo "please Enter your $element"
    read answer[i]
    i=$((i+1))
  done
joinByChar , ${answer[@]}
echo $OUT >> $file 



else
  echo your table doesnot Exist
fi
