# Custom palette for the Linux console.
#
if [ "$TERM" = "linux" ]; then
   echo -en "\e]P0141414"  #black
   echo -en "\e]P1906232"  #darkred
   echo -en "\e]P25B762F"  #darkgreen
   echo -en "\e]P3AA9943"  #brown
   echo -en "\e]P4727CB0"  #darkblue
   echo -en "\e]P5706C9A"  #darkmagenta
   echo -en "\e]P692B19E"  #darkcyan
   echo -en "\e]P7AEAEAE"  #lightgrey (dark white)
   #bright colours
   echo -en "\e]P8777777"  #darkgrey
   echo -en "\e]P9A85B2B"  #red
   echo -en "\e]PA89B83F"  #green
   echo -en "\e]PBEFCF80"  #yellow
   echo -en "\e]PA6B8FF8"  #blue
   echo -en "\e]PD826AB1"  #magenta
   echo -en "\e]PEA1CDCD"  #cyan
   echo -en "\e]PFF0F0F0"  #white
   clear # avoid artifacts
fi
