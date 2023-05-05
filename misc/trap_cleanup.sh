#/usr/bin/env sh
#
# Create temporary file, use it, and ensure it is deleted
# when the script exits, or the user pressed ‹Ctrl+C›. Uses
# a function as a `trap` ‹command›.
#
tmpfile="$(mktemp -t tmp.XXXXXX)" #← create temporary file.
trap cleanup EXIT INT             #← trap EXIT (0) and INT.

cleanup () {                      #← cleanup function.
   printf "\b\bRemoving $tmpfile\n"
   rm "$tmpfile"
   trap - EXIT INT                #← disable trap.
   exit
   }

echo "Some text" >> "$tmpfile"    #← use temporary file.

count=10                          #← ‘work’ for 10 seconds.
while [ $count -gt 0 ]; do
   printf "%2d: %s\n" "$count" "$(cat $tmpfile)"
   count=$((count - 1))
   sleep 1
done
