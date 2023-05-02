#!/usr/bin/env sh
#
# Process options using the `getopt` command. This script recognises:
# `-v` (verbose), `-h` (help), `-o ‹file›` and `-i ‹file›`. Each has
# a long variant: `--verbose`, `--help`, `--input` and `--output`.
# Options are parsed, and the results displayed.
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
  -i, --input <input-file>
      Where input is obtained from (default stdin).
  -o, --output <output-file>
      Where output is written to (default stdout).
  -v, --verbose
      Turn verbosity on (off by default).
  -h, --help
      Display this help.
"
# Parse options with `getopt`.
#
OPTS=$(getopt -o vhi:o: \
   --long "verbose,help,input:,output:" -- "$@")
eval set -- "$OPTS"

# Process options.
#
while true; do
   case "$1" in
      -h|--help)    echo "$helpstr" ; exit 0  ;;
      -v|--verbose) verbose=true    ; shift   ;;
      -i|--input)   input="$2"      ; shift 2 ;;
      -o|--output)  output="$2"     ; shift 2 ;;
      --) shift ; break ;;
   esac
done

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
