#!/bin/bash
echo "ENTER THE NUMBER"
read n

rnum=0

while [ $n -gt 0 ]
do
    remainder=$((n % 10))
    rnum=$((rnum * 10 + remainder))
    n=$((n / 10))
done

echo "REVERSE OF THE GIVEN NUMBER IS $rnum"