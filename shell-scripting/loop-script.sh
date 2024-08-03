#!/bin/bash
for i in {1..5}; do
    echo $i
done

while true; do
    echo "This is an infinite loop."
    break
done

i=0
while [ $i -lt 5 ]; do
    echo $i
    i=$((i+1))
done