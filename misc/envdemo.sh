#!/usr/bin/env sh
#
# Using ‘env ‹var›=‹value› ‹command›’ vs ‘‹var›=‹value› ‹command›’ and
# the ‹var›iable's visibility in sub-processes. Also call this script
# with: ‘VAR1=X VAR2=Y ./envdemo.sh’ or with ‘env VAR1=X ...’.
#
# In a script, either two options do *not* export the variables. While
# using these options in an interactive shell, *will* export them.
#
# Using ‹var›=‹value› and one subshell:
echo  "Before  1) VAR1=$VAR1 VAR2=$VAR2"
VAR1=VAL1 VAR2=VAL2 sh -c \
'echo "Process 1) VAR1=$VAR1 VAR2=$VAR2"'
echo  "After   1) VAR1=$VAR1 VAR2=$VAR2"

# Using env ‹var›=‹value› and one subshell:
echo  "Before  2) VAR1=$VAR1 VAR2=$VAR2"
env VAR1=VAL1 VAR2=VAL2 sh -c \
'echo "Process 2) VAR1=$VAR1 VAR2=$VAR2"'
echo  "After   2) VAR1=$VAR1 VAR2=$VAR2"

# Using ‹var›=‹value› and two subshells:
echo  "Before  3) VAR1=$VAR1 VAR2=$VAR2"
VAR1=VAL1 VAR2=VAL2 sh -c \
   "sh -c 'echo \"Process 3) VAR1=$VAR1 VAR2=$VAR2\"'"
echo  "After   3) VAR1=$VAR1 VAR2=$VAR2"

# Using env ‹var›=‹value› and two subshells:
echo  "Before  4) VAR1=$VAR1 VAR2=$VAR2"
env VAR1=VAL1 VAR2=VAL2 sh -c \
   "sh -c 'echo \"Process 4) VAR1=$VAR1 VAR2=$VAR2\"'"
echo  "After   4) VAR1=$VAR1 VAR2=$VAR2"
