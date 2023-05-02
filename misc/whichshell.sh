#!/usr/bin/env sh
#
# Prints the *system shell*, user's *login shell* and the
# shell that is used to *interpret* this script.
#
sys_shell="$(which $(readlink $(which sh)))"
echo "System shell (sh) = $sys_shell"
echo "Login shell ($(whoami)) = $(which $SHELL)"
echo "Script shell = $(readlink -f /proc/$$/exe)"
