#!/usr/bin/env sh
#
# Process input from variable line-by-line. Key: `while IFS= read -r`.
#
input="\
This is the first line of input,
and this is the second text line.
Third and final line of text."

process_line () { echo "$1" "$2"; }

# Option 1: provide `input` as a heredoc.
#
while IFS= read -r line; do
   process_line "1)" "|$line|"
done <<EOF
$(printf '%s\n' "$input")
EOF

# Option 2: pipe contents of `input` to `while` loop.
#
printf '%s\n' "$input" \
|  while IFS= read -r line; do
      process_line "2)" "|$line|"
   done
