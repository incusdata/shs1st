#!/usr/bin/env sh
#
# A POSIX-compatible script that provides a `select`-like menu.
#
pause() {
   printf "Press ENTER to continue..."
   read dummy ; unset dummy
   }

PROMPT='Select an option?: '

while true; do
   clear ; echo ; echo
   printf "%s\n%s\n%s\n" \
      '1) Option 1' '2) Option 2' '3) Quit'
   printf "\n$PROMPT" ; read -r choice
   case $choice in
      1) echo "You chose option 1"
         pause ;;
      2) echo "You chose option 2"
         pause ;;
      3) echo "Terminating"
         break ;;
      *) echo "Invalid: '$choice'"
         pause ;;
   esac
done
