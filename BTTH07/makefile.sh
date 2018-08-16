#! /bin/bash

makeAMakeFile ()
{
    echo -n -e "all: exo \nexo: "
    for i in $*; do 
	echo -n "${i/.c/.o}"
	done
    echo -n -e "\n\tgcc "
    for i in $*; do 
	echo -n "${i/.c/.o}"
	done
    echo " -o exo"
    for i in $*; do
	echo -e "${i/.c/.o}: $i\n\t gcc -c $i"
	done
    echo -e "clean:\\n\trm -f*.o exo\ndepend:\n\tmakedepend *.c"
}

makeAMakeFile BTTH07a.c BTTH07b.c
