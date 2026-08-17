#!/bin/bash

echo "Optimal Page Replacement"

pages=(7 0 1 2 0 3 0 4 2 3 0 3 2)
frames=3

declare -a memory
fault=0

for ((i=0; i<frames; i++))
do
    memory[$i]=-1
done

for ((i=0; i<${#pages[@]}; i++))
do
    page=${pages[$i]}
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
        pos=-1

        for ((j=0; j<frames; j++))
        do
            if [ "${memory[$j]}" = "-1" ]
            then
                pos=$j
                break
            fi
        done

        if [ $pos -eq -1 ]
        then
            farthest=-1

            for ((j=0; j<frames; j++))
            do
                nextUse=${#pages[@]}

                for ((k=i+1; k<${#pages[@]}; k++))
                do
                    if [ "${memory[$j]}" = "${pages[$k]}" ]
                    then
                        nextUse=$k
                        break
                    fi
                done

                if [ $nextUse -gt $farthest ]
                then
                    farthest=$nextUse
                    pos=$j
                fi
            done
        fi

        memory[$pos]=$page
        fault=$((fault + 1))
    fi
done

echo "Total Page Faults = $fault"