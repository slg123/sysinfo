#!/bin/sh

i=`awk '{ sum += $3 } END { print sum }' usr_sizes.txt`
total=`echo "$i / 1024 / 1024 / 1024" | bc`
echo "$total GB"

