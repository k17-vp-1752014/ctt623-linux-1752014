#!/bin/bash
showHelp ()
{
    echo "$0 [-h|--hrlp] [-a|--all] [-f|--find filename] [-c|--count filename] [dir]"
}

while [ $# -ge 1 ] ; do

    case $1 in
	-h|--help) showHelp
	    shift
	    ;;
	-a|--all) flag_all=true
	    shift
	    ;;
	-f|--find) flag_find=true
	    filename="$1"
	    shift
	    ;;
	-c|--count) flag_countline=true
	    shift
	    ;;
	*) echo "Nothing"
	    exit 1
    esac
    done

showAllFiles ()
{
    if [ -d $1 ]
    then
	files="$1/*"
	for file in $files
	do
	    echo ${file##*/}
	done
    else
	echo "Link does not exist"
	exit
    fi	
}

findFile () 
{
    local dir="$1"
    local filename="$2"
    for d in $dir/* ; do
	fname=${d##*/}
	if [ "$fname"="$filename" ] ; then
	    echo "$d"
	fi
    done
}

countLines ()
{
    local dir="$1"
    if ! [ -f $dir ] ; then
	echo "File does not exist."
	exit 1
    elif ! [ -r $dir ] ; then
	echo "Cannot read file."
    else
	echo "${dir##*/}"
	echo $( wc -l < $dir)
    fi
}

showInfos ()
{
    if $flag_countLine; then 
	echo "$(countLines /home/phucduc/Desktop/test1)"
    fi
    if $flag_find; then
	echo "$(findFile /home/phucduc/Desktop/text)"
    fi
    if $flag_all; then
	echo "$(showAllFiles /etc)"
    fi
}

showInfos






