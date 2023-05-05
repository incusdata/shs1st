# Snippets

The scripts in here, are not all necessary complete & runnable scripts. They mostly contain snippets of re-usable shell script code, to be incorporated in other scripts.

## [`count_evens.sh`][shs1st-snip-count_evens_sh] — Count Even Numbers

Simple script to count only the even numbers in a list of integers. The main point is to serve as an example for the [**`continue`** command][man7-bash-continue], discussed under [`continue` Command][idgh-shs1st-wiki-script-extx-cont].

[shs1st-snip-count_evens_sh]:
   https://github.com/incusdata/shs1st/blob/main/snip/count_evens.sh
   "GitHub — Incus Data / Shell Scripting First / Snippets / count_evens.sh"
[man7-bash-continue]:
   https://ss64.com/bash/continue.html
   "man7/bash continue — Perform next iteration of a loop" 
[idgh-shs1st-wiki-script-extx-cont]:
   https://github.com/incusdata/shs1st/wiki/06-Shell-Scripts#continue-command
   "GitHub — Incus Data / Shell Scripting First / Wiki / Execution Transfer / continue Command"

## [`indented_heredoc.sh`][shs1st-snip-indented_heredoc_sh] — Indented Here Documents

In scripts, [here documents][w-heredoc] (heredocs) can be indented if they start with `<<-`. However, the indentation must be performed with hard ‹TAB› characters (not spaces). This snippet in this script shows various hard ‹TAB› indented heredocs. The output will show that the shell removes all hard ‹TAB› indentation.

[shs1st-snip-indented_heredoc_sh]:
   https://github.com/incusdata/shs1st/blob/main/snip/indented_heredoc.sh
   "GitHub — Incus Data / Shell Scripting First / Snippets / indented_heredoc.sh"
[w-heredoc]:
   https://en.wikipedia.org/wiki/Here_document
   "Wikipedia — Here Documents"

## [`linux_console.sh`][shs1st-snip-linux_console_sh] — Linux Console Palette

This file contains [escape sequences][man7-console_codes4] to set the palette of 16 colours that a Linux [console][w-linux-cons] supports. These sequences are unique to the Linux console, which otherwise emulates a [VT-102][w-vt100] terminal.

[shs1st-snip-linux_console_sh]:
   https://github.com/incusdata/shs1st/blob/main/snip/linux_console.sh
   "GitHub — Incus Data / Shell Scripting First / Snippets / linux_console.sh"
[man7-console_codes4]:
   https://www.man7.org/linux/man-pages/man4/console_codes.4.html
   "man7/Linux — console_codes(4) — Linux console escape and control sequences"
[w-linux-cons]:
   https://en.wikipedia.org/wiki/Linux_console
   "Wikipedia — Linux Console"
[w-vt100]:
   https://en.wikipedia.org/wiki/VT100
   "Wikipedia — VT100 Terminal"

## [`menu_demo.sh`][shs1st-snip-menu_demo_sh] — Menu Demo

Interactively displays a list (or *menu*) of options, from which the user can select one by number. It does not require the [**`select`** command][ss64-bash-select], while  [`select_demo.bash`](#select_demobashshs1st-misc-select_demo_bash--select-demo) does.

[ss64-bash-select]:
   https://ss64.com/bash/select.html
   "SS64/bash select — Easy menu generation"
[shs1st-snip-menu_demo_sh]:
   https://github.com/incusdata/shs1st/blob/main/snip/menu_demo.sh
   "GitHub — Incus Data / Shell Scripting First / Snippets / menu_demo.sh"

## [`mult_odds.sh`][shs1st-snip-mult_odds_sh] — Multiply Odd Numbers

Simple script to output a multiplication table for only the odd numbers in a list. This script serves as an example for the [**`continue`** command][man7-bash-cont] that takes a positive integer argument, discussed under [`continue` Command][idgh-shs1st-wiki-script-extx-cont] in the wiki.

[shs1st-snip-mult_odds_sh]:
   https://github.com/incusdata/shs1st/blob/main/snip/mult_odds.sh
   "GitHub — Incus Data / Shell Scripting First / Snippets / mult_odds.sh"
[man7-bash-cont]:
   https://ss64.com/bash/continue.html
   "man7/bash break — Evaluate next iteration of a loop" 
[idgh-shs1st-wiki-script-extx-cont]:
   https://github.com/incusdata/shs1st/wiki/06-Shell-Scripts#continue-command
   "GitHub — Incus Data / Shell Scripting First / Wiki / Execution Transfer / continue Command"

## [`process_lines.sh`][shs1st-snip-process_lines_sh] — Line-Wise Processing

To process input line-by-line, we need to change `IFS` ([Input Field Separator][w-ifs]), part of the [POSIX Shell Variables][og-util-shcmd-shvars]; and use the [**`read(1p)`**][man7-read1p] built-in.

For safety, we add the `-r` (‘raw’) option, which will prevent [**`read`**][man7-read1p] from interpreting backslash (**`\`**) escape sequences. This means that if the input contains a backslash followed by a newline character, [**`read`**][man7-read1p] will interpret it as two separate characters, instead of ignoring the newline character.

Here's an example to illustrate the difference:

```sh
#!/usr/bin/env sh

printf 'Line 1\\\nLine 2\n' | while read line; do
    printf '%s\n' "$line"
done

printf 'Line 1\\\nLine 2\n' | while read -r line; do
    printf '%s\n' "$line"
done
```

The first [**`while`**][og-util-shcmd-while] loop uses [`read`][man7-read1p] without the `-r` option, so it interprets the backslash followed by a newline character as an escape sequence and ignores the newline character. As a result, it outputs a single line: `Line 1Line 2`.

The second [**`while`**][ss64-while] loop uses [`read`][man7-read1p] with the `-r` option, so it treats the backslash and newline characters as separate characters. As a result, it outputs two lines: `Line 1\` and `Line 2`.

See [**`misc/line_by_line.sh`**][shs1st-misc-line_by_line_sh] for an example script that process standard input line-by-line, without using [**`cat(1p)`**][man7-cat1p].

[shs1st-snip-process_lines_sh]:
   https://github.com/incusdata/shs1st/blob/main/snip/process_lines.sh
   "GitHub — Incus Data / Shell Scripting First / Snippets / process_lines.sh"
[shs1st-misc-line_by_line_sh]:
   https://github.com/incusdata/shs1st/blob/main/misc/line_by_line.sh
   "GitHub — Incus Data / Shell Scripting First / Miscellaneous / line_by_line.sh"
[w-ifs]:
   https://en.wikipedia.org/wiki/Input_Field_Separators
   "Wikipedia — Input Field Separators"
[og-util-shcmd-shvars]:
   https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_05_03
   "POSIX — Utilities / Shell Command Language # 2.5.3 Shell Variables"
[man7-read1p]:
   https://www.man7.org/linux/man-pages/man1/read.1p.html
   "man7/Linux — read(1p) — Read from standard input into shell variable"
[ss64-while]:
   https://ss64.com/bash/while.html
   "SS64/Bash — while built-in command"
[og-util-shcmd-while]:
   https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_09_04_09
   "POSIX — Utilities / Shell Command Language # 2.9.4 Compound Commands .. while"

## [`select_demo.bash`][shs1st-snip-select_demo_bash] — Select Demo

This script works with **bash** and **zsh** (maybe **ksh**), and uses the non-POSIX [**`select`** command][ss64-bash-select] to display a menu of options, from which the user is required to choose one by number.

[ss64-bash-select]:
   https://ss64.com/bash/select.html
   "SS64/bash select — Easy menu generation"
[shs1st-snip-select_demo_bash]:
   https://github.com/incusdata/shs1st/blob/main/snip/select_demo.bash
   "GitHub — Incus Data / Shell Scripting First / Snippets / select_demo.bash"

## [`sosedemo.sh`][shs1st-snip-sosedemo_sh] — Standard Out, Standard Error 

This script only contains commands that write lines of text. Some lines are written to standard error (`2`), and some lines are written to standard output (`1`). Several workable options are shown. The `1>&2` (or `>&2`) ‘binding’ works on all commands that produce standard output, not just `echo`.

Use the script to experiment with output redirection:

```sh
$ sh sosedemo.sh  > /dev/null          #←show only stderr output.
$ sh sosedemo.sh 1> /dev/null          #←same as above.
$ sh sosedemo.sh 2> /dev/null          #←show only stdout output.
$ sh sosedemo.sh  > /dev/null 2>&1     #←snow nothing.
```

[shs1st-snip-sosedemo_sh]:
   https://github.com/incusdata/shs1st/blob/main/snip/sosedemo.sh
   "GitHub — Incus Data / Shell Scripting First / Snippets / sosedemo.sh"

## [`stdin_or_file.sh`][shs1st-snip-stdin_or_file_sh] — Read Standard Input or File

Many programs, such as [**`cat(1p)`**][man7-cat1p] and [**`sort(1p)`**][man7-sort1p], can read from standard input if no files are specified as command-line arguments. To read from standard input until the end-of-file (‹EOF›) marker is reached, you can use **`$(cat)`**. Alternatively, you can use `$(cat "$1")` to read from a file that is passed as the first argument to the program.

Note that the [GNU Core Utilities][w-gnu-coreutils] versions of the [**`cat(1)`**][man7-cat1] and [**`sort(1)`**][man7-sort1] commands have significantly more useful options than the POSIX versions. Keep this in mind if POSIX-compatibility is a concern.

See [**`misc/line_by_line.sh`**][shs1st-misc-line_by_line_sh] for an example that process standard input line-by-line, without using [**`cat(1p)`**][man7-cat1p].

[shs1st-snip-stdin_or_file_sh]:
   https://github.com/incusdata/shs1st/blob/main/snip/stdin_or_file.sh
   "GitHub — Incus Data / Shell Scripting First / Snippets / stdin_or_file.sh"
[man7-cat1p]:
   https://man7.org/linux/man-pages/man1/cat.1p.html
   "man7/cat(1p) — Concatenate and print files"
[man7-cat1]:
   https://man7.org/linux/man-pages/man1/cat.1.html
   "man7/cat(1) — Concatenate files and print on standard output" 
[man7-sort1p]:
   https://man7.org/linux/man-pages/man1/sort.1p.html
   "man7/sort(1p) — Sort, merge, or sequence check text files"
[man7-sort1]:
   https://man7.org/linux/man-pages/man1/sort.1.html
   "man7/sort(1) — Sort lines of text files" 
[w-gnu-coreutils]:
   https://en.wikipedia.org/wiki/GNU_Core_Utilities
   "Wikipedia — GNU Core Utilities"

## [`unique_paths.bash`][shs1st-snip-unique_paths_bash] — Unique Paths 

This script works with **bash** and **zsh** (maybe **ksh**), and uses non-POSIX [arrays][bash-ref-arrays] to eliminate duplicate paths as found in the `PATH` environment variable. Assuming the script is in the current directory: 

```sh
$> . ./unique_paths.bash
$> unique_paths "/abc:/def/:/abc/:/def"
#→ abc:/def
$> export PATH="$(unique_paths $PATH)"
```

Note that paths are normalised, so that `/abc` and `/abc/` are treated the same.

[bash-ref-arrays]:
   https://www.gnu.org/software/bash/manual/html_node/Arrays.html
   "Bash Reference — 6.7 Arrays"
[shs1st-snip-unique_paths_bash]:
   https://github.com/incusdata/shs1st/blob/main/snip/unique_paths.bash
   "GitHub — Incus Data / Shell Scripting First / Snippets / unique_paths.bash"

## [`unique_paths.sh`][shs1st-snip-unique_paths_sh] — Unique Paths (POSIX)

This script works POSIX shells to eliminate duplicate paths as found in the `PATH` environment variable. Assuming the script is in the current directory: 

```sh
$> . ./unique_paths.sh
$> unique_paths "/abc:/def/:/abc/:/def"
#→ abc:/def
$> export PATH="$(unique_paths $PATH)"
```

Note that paths are normalised, so that `/abc` and `/abc/` are treated the same.

[shs1st-snip-unique_paths_sh]:
   https://github.com/incusdata/shs1st/blob/main/snip/unique_paths.sh
   "GitHub — Incus Data / Shell Scripting First / Snippets / unique_paths.sh"
