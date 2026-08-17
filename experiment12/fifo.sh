#!/bin/bash

echo "FIFO Page Replacement"

pages=(7 0 1 2 0 3 0 4 2 3 0 3 2)
frames=3

declare -a memory
pointer=0
fault=0

for ((i=0; i<frames; i++))
do
    memory[$i]=-1
done

for page in "${pages[@]}"
do
    found=0

    for ((j=0; j<frames; j++))
    do
        if [ "${memory[$j]}" = "$page" ]
        then
            found=1
            break
        fi
    done

    if [ $found -eq 0 ]
    then
        memory[$pointer]=$page
        pointer=$(((pointer + 1) % frames))
        fault=$((fault + 1))
    fi
done

echo "Total Page Faults = $fault"