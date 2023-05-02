#!/usr/bin/env sh
#
# Display arguments passed to script, as well as the script name.
# Attempt to use all the special ‘parameter’ variables. There is
# no need for `$2`…`$9`; only: `$0`, `$1`, `$#`, `$*`, and `$@`.
#
printf "Script: $0 -- "
if [ -z "$1" ]; then
   echo "No arguments passed"
else
   if [ $# -eq 1 ]; then
      echo "One argument passed"
   else
      echo "$# arguments passed"
   fi

   printf "\n1 ) All arguments with \$*: |$*|\n"

   printf "\n2a) Process \$* with \`for \"\$*\"\`...\n"
   num=1
   for arg in "$*"; do
      printf "    Arg %2d: %s\n" $num "$arg"
      num=$((num+1))
   done

   printf "\n2b) Process \$* with \`for \$*\` ...\n"
   num=1
   for arg in $*; do
      printf "    Arg %2d: %s\n" $num "$arg"
      num=$((num+1))
   done

   printf "\n3a) Process \$@ with \`for \"\$@\"\`...\n"
   num=1
   for arg in "$@"; do
      printf "    Arg %2d: %s\n" $num "$arg"
      num=$((num+1))
   done

   printf "\n3b) Process \$@ with \`for \$@\`...\n"
   num=1
   for arg in $@; do
      printf "    Arg %2d: %s\n" $num "$arg"
      num=$((num+1))
   done

   printf "\n4 ) Process args with \`while\` and \`shift\`...\n"
   num=1
   while [ -n "$1" ]; do
      printf "    Arg %2d: %s\n" $num "$1"
      num=$((num+1))
      shift
   done

fi
