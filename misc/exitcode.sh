#!/usr/bin/env sh
#
# Exits with command-line supplied, or default, exit code. Checks for
# an EXIT_CODE environment variable, but is ignored if a command-line
# argument is present.
#
invalid="Invalid exit code"
code=0
if [ -n "$1" ]; then
   code=$1;
elif [ -n "$EXIT_CODE" ]; then
   code=$EXIT_CODE
fi

case $code in
   ''|*[!0-9]*)
      echo >&2 "$invalid (not an integer)"
      exit 1 ;;
esac

if [ "$code" -lt 0 ] || [ "$code" -gt 255 ]; then
   echo >&2 "$invalid (not in range [0..255])"
   exit 2
fi

(exit "$code")
