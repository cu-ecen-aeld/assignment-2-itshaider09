#!/usr/bin/bash
if [ $# -lt 2 ]
then
    echo 'ERROR: Invalid Number of Arguments.'
    echo 'Total nimber of arguments should be 2.'
    echo 'The order of the arguments should be:'
    echo '  1)File Directory Path.'
    echo '  2)String to be searched in the specified directory path.'
    exit 1
fi
filesdir=$1
searchstr=$2
#echo

#echo "Argument 1: $filesdir"
#echo "Argument 2: $searchstr"
#echo
numberOfFiles=0
numberOflines=0
if [ -d $filesdir ]
then    
    #echo Directory Exists
    for file in $filesdir/*
    do
        
        tmp=$( cat $file | grep $searchstr | wc -l)
        #echo $tmp
        if [ $tmp -gt 0 ]
        then
            ((numberOfFiles++))
            ((numberOflines+=tmp))
        fi
        
        
        #echo "There are $numberOflines matching lines in file $numberOfFiles"
    done
else  
    #echo No Such file or Directory exists
    exit 1
fi
echo "The number of files are $numberOfFiles and the number of matching lines are $numberOflines"
exit 0