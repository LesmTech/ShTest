output=`find . -name 'integration.yml'`
# transfer string to array by sytex
array=($output)
echo ${array[0]}
echo ${#array[@]}

if [ 1 -lt ${#array[@]} ] 
then echo "valid"
else echo "not valid"
fi

# for word in $output
# do
# 	echo $word
# done

target_branch="7.10"

target_tag="7.10.0-beta"

cat ${array[0]} | { while read line 
do 
	if [[ $line == version* ]]
	then 
		fileOutput+="version: $target_tag\n"	
		continue
	fi
	if [[ $line == branch* ]]
	then 
		fileOutput+="branch: $target_branch\n"	
		continue
	fi
	fileOutput+=$line
	fileOutput+="\n"
done;
	echo $fileOutput > ${array[0]}
}