#!/usr/bin/env sh
#
# Process input line-by-line without using `cat`. Read lines from
# standard input, or from file passed as a command line argument.
# Exit with message to standard error if the file is not readable.
#
input="standard input"
if [ -n "$1" ]; then
   if [ -r "$1" ]; then
      input="$1"
      exec < "$input"
   else
      >&2 echo "ERROR: Cannot read ‘$1’."
      exit 2
   fi
fi

process_line () { echo "$1" "$2"; }

mark="------------------------------------------"
echo "SOURCE: $input" ; echo "$mark"
while IFS= read -r line; do
   process_line ">>" "|$line|"
done
echo "$mark"
