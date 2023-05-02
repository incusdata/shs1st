#!/usr/bin/env sh
#
# Process options using the POSIX `getopts` command. This script
# recognises: `-v` (verbose), `-h` (help), `-o ‹file›` and `-i ‹file›`.
# Optional script arguments may follow the options. The options are
# parsed, and the results displayed.
#

# Initialize example option variables.
#
verbose=false
input="‹stdin›"
output="‹stdout›"
helpstr="
getopt_demo - Process and Display Options

$0 [ <options> ] [ <arguments> ]

OPTIONS:
  -i <input-file>
      Where input is obtained from (default stdin).
  -o <output-file>
      Where output is written to (default stdout).
  -v  Turn verbosity on (off by default).
  -h  Display this help.
"

# Process options and remove when done.
#
while getopts "hvi:o:" opt; do
   case $opt in
      h) echo "$helpstr" ; exit 0  ;;
      v) verbose=true     ;;
      i) input="$OPTARG"  ;;
      o) output="$OPTARG" ;;
      --) shift ; break   ;;
   esac
done
shift $((OPTIND-1))

# Output current state of the options.
# 
echo "Verbose: $verbose"
echo "Input  : $input"
echo "Output : $output"

# Output remaining arguments, if any.
#
if [ -z "$1" ]; then exit; fi
echo "Arguments:"
for arg in "$@"; do
   echo "   $arg"
done
