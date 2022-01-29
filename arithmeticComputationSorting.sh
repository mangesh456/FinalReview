#!/bin/bash -x


declare -A DictionaryResult
echo "Enter Three Inputs"
read -p "Enter First Number: " a
read -p "Enter Second Number: " b
read -p "Enter Third Number: " c
count=0;

result1=`echo "$a+$b*$c" | bc`
result2=`echo "$a*$b+$c" | bc`
result3=`echo "$c+$a/$b" | bc`
result4=`echo "$a%$b+$c" | bc`

DictionaryResult[result1]=$result1
DictionaryResult[result2]=$result2
DictionaryResult[result3]=$result3
DictionaryResult[result4]=$result4

for((i=1; i<=${#DictionaryResult[@]};i++))
do
	array[$count]=${DictionaryResult[result"$(( count+1))"]}
	count=$(( count+1 ))
done
	echo ${array[@]}

for((i=0;i<3;i++))
do
   for((j=i+1;j<4;j++))
   do
      if [[ ${array[i]%.*} -lt ${array[j]%.*} ]]
      then
            temp=${array[i]}
            array[i]=${array[j]}
            array[j]=$temp
      fi
   done
done

echo Ascending order : ${array[@]}

for((i=0;i<3;i++))
do
   for((j=i+1;j<4;j++))
   do
      if [[ ${array[i]%.*} -gt ${array[j]%.*} ]]
      then
            temp=${array[i]}
            array[i]=${array[j]}
            array[j]=$temp
      fi
   done
done

echo Ascending order : ${array[@]}
