#!/usr/bin/env sh
#
# Print the multiplication table for numbers in a range,
# e.g., [1..5], skipping even numbers.
#
nums="1 2 3 4 5"
for i in $nums; do
   for j in $nums; do
      if [ $(($i % 2)) -eq 0 ]; then
         continue 2
      fi
      echo "$i × $j = $(($i * $j))"
   done
done
