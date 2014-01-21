#!/bin/sh

i=`awk '{ sum += $3 } END { print sum }' usr_sizes.txt`
echo "$i GB"

