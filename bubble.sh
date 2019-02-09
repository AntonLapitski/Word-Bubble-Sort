#!/bin/bash

exchange()
{
  local temp=${Words[$1]}

  Words[$1]=${Words[$2]}
  Words[$2]=$temp

  return
}

declare -a Words

Words=("$@")

clear

number_of_elements=${#Words[@]}
let "comparisons = $number_of_elements - 1"

count=1

while [ "$comparisons" -gt 0 ]
do

  index=0

  while [ "$index" -lt "$comparisons" ]
  do
    if [ ${Words[$index]} \> ${Words[`expr $index + 1`]} ]
    then
      exchange $index `expr $index + 1`
    fi
    let "index += 1"
  done
let "comparisons -= 1"

let "count += 1"

done
echo "${Words[@]}"
exit 0
