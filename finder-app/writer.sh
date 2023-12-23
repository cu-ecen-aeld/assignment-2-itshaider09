if [ $# -lt 2 ]
then    
    echo Error:Number of Arguments are less than 2.
    exit 1
fi
writefile=$1
writestr=$2
echo "Argument 1: $writefile"
echo "Argument 2: $writestr"
echo
dir=$(dirname "$writefile")
if [ ! -d dir ]
then
    mkdir -p "$dir"
    echo creating parent directory
fi
echo $writestr > $writefile
if [ $? -eq 0 ]
then
    echo Successfully written
else
    exit 1
fi

    
