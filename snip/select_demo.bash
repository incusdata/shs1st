#!/usr/bin/env bash
#
# Example using `select`, which works in bash and zsh. Setting
# `COLUMNS=1` forces zsh to display the ‘menu’ vertically, otherwise
# it will show it horizontally.
#
pause () { printf "Press ENTER to continue..."; read; }

while true; do
   clear ; echo ; echo
   COLUMNS=1
   PS3='Select an option?: '
   select opt in 'Option 1' 'Option 2' 'Quit'; do
      case $opt in
         'Option 1')
            echo "You chose option 1"  ; pause   ;;
         'Option 2')
            echo "You chose option 2"  ; pause   ;;
         'Quit') echo "Terminating"    ; break 2 ;;
         *) echo "Invalid: \`$REPLY\`" ; pause   ;;
      esac
      break
   done
done
