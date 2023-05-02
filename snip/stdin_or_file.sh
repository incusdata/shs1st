#!/usr/bin/env sh
#
# Read text until EOF from standdard input, or from a file provided
# as a command-line argument. Key is: use `$(cat)` or `$(cat "$1")`.
#
process_input () {
   echo ; echo "$1"       #←heading
   echo "<<$2>>" ; echo   #←content
   }

if [ -z "$1" ]; then
   process_input "STANDARD INPUT"  "$(cat)"
else
   input=$(cat "$1")
   process_input "FILE ($1)" "$input"
fi
