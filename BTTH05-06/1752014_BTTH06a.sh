#! /bin/bash

getLengthList ()
{
    echo "$#"
}

displayList ()
{
    echo "Length : $(getLengthList $*)"
    for i in $*; do
	echo "$i"
    done
}

getEvenNumbers ()
{
    echo "Even numbers : "
    for i in $*; do
    if ((i%2==0)); then
	echo "$i"
    fi
    done
}

getOddNumbers ()
{
    echo "Odd numbers: "
    for i in $*; do
    if ((i%2!=0)); then
	echo "$i"
    fi
    done
}

max=-9999999999
getMax ()
{
    for i in $*; do
    if ((i>max)); then
	((max=i))
    fi
    done
    echo "Max: $max"
}

min=999999999
getMin ()
{
    for i in $*; do
    if ((i<min)); then
	((min=i))
    fi
    done
    echo "Min: $min"
}

getValueAt ()
{
    echo "Enter position needing found: "; read a
    dem=1
    if ((a<1 || a>$#)); then
	echo "Invalid input"
	exit
    fi
    for i in $*; do
    if ((dem==a)); then
	echo "Value found: $i"
	return
    fi
    ((dem++))
    done
}

input="$1"
output="$2"

showInfos ()
{
    displayList $*
    getEvenNumbers $*
    getOddNumbers $*
    getMax $*
    getMin $*
    getValueAt $*
}
readfile ()
{
    if test -e $1; then
    exec 3>$2
    while read line; do
	showInfos $line >&3
    done <"$1"
    exec 3>&-
    else
	echo "File does not exist"
    exit 1
    fi 
}

process ()
{
    local input="$1"
    local output="$2"
    readfile $input $output
}

process $input $output

