#!/usr/bin/env sh
#
#  Write some lines of text to both standard output and standard
#  error. Use it to experiment with redirection and piping on the
#  command-line.
#
     echo "standard output text 1"
>&2  echo "standard error text 1"
1>&2 echo "standard error text 2"
     echo "standard error text 3" >&2
     echo "standard output text 2"
