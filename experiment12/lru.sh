#!/bin/bash

echo "LRU Page Replacement"

pages=(7 0 1 2 0 3 0 4 2 3 0 3 2)
frames=3

declare -a memory
declare -a used

fault=0
count=0

for ((i=0; i<frames; i++))
do
    memory[$i]=-1
    used[$i]=0
done

for page in "${pages[@]}"
do
    found=0
    count=$((count + 1))

    for ((j=0; j<frames; j++))
    do
        if [ "${memory[$j]}" = "$page" ]
        then
            found=1
            used[$j]=$count
            break
        fi
    done

    if [ $found -eq 0 ]
    then
        pos=0

        for ((j=0; j<frames; j++))
        do
            if [ "${memory[$j]}" = "-1" ]
            then
                pos=$j
                break
            fi

            if [ "${used[$j]}" -lt "${used[$pos]}" ]
            then
                pos=$j
            fi
        done

        memory[$pos]=$page
        used[$pos]=$count
        fault=$((fault + 1))
    fi
done

echo "Total Page Faults = $fault"