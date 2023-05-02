#!/usr/bin/env sh
#
# Count even numbers in a list of integers.
#
nums="1 2 3 4 5 6 7 8 9 10"
count=0

for num in $nums; do
  if [ $(($num % 2)) -ne 0 ]; then continue; fi
  count=$((count + 1))
done

echo "$count even numbers in the $nums"
