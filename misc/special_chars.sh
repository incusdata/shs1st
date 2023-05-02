#!/usr/bin/env sh
#
# Print shell special characters to illustrate escaping & quoting. This
# script contains embedded literal ASCII escape characters (0x1B/27).
#
echo
echo "───────────────────────────────────────────────────────────"
echo "[1F[2C┤ S P E C I A L   C H A R A C T E R S ├"
echo "  | & ; < > ( ) \$ \` \\ \" ' SP TAB NL * ? [ ] # ˜ = % { } !"
echo '  | & ; < > ( ) $ ` \ " '"'"' SP TAB NL * ? [ ] # ˜ = % { } !'
echo \ \ \| \& \; \< \> \( \) \$ \` \\ \" \' SP TAB NL \
   \* \? \[ \] \# \˜ \= \% \{ \} \!

# vim: et ts=3 sw=3 sts=3 ff=unix fenc=utf-8 :
