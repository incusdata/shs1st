# Miscellaneous

Scripts that do not fit into a well-defined category lives here. Most exist
primarily for educational purposes.

## [`envdemo.sh`][shs1st-misc-envdemo_sh] — Env Command Demo 

We can set variables before a ‹*command*› on the same command-line. We can either use the
 [**`env(1)`** command][man7-env1], which is normally a built-in command for most shells; or we can simply set the variables before the command. See the [wiki][idgh-wiki-variables-env] for more detail.

Run this script normally, and inspect the output. You will see that only the ‹*command*› (`sh -c` in this case) will ‘see’ `VAR1` and `VAR2` (`1)` and `2)`), but not its sub-processes (`3)` and `4)`). Never will these variables as set in the script, be visible in sub-processes.

Run this script by setting `VAR1` and `VAR2` using either syntax. You will see that now the variables are effectively exported to the ‹*command*›, so its sub-processes will have access to `VAR1` and `VAR2` as set in the *interactive shell*.

```{.sh}
$ ./envdemo.sh
$ ./envdemo.sh | grep 'Process'
$ VAR1=xxxx VAR2=zzzz ./envdemo.sh
$ VAR1=xxxx VAR2=zzzz ./envdemo.sh | grep 'Process'
$ env VAR1=xxxx VAR2=zzzz ./envdemo.sh
```

For cases `1` and `2` the `Process` is a one level deep ‹*command*›. For cases `3` and `4`, the 'Process` is a child process of the ‹*command*› (2 levels deep).

[shs1st-misc-envdemo_sh]:
   https://github.com/incusdata/shs1st/blob/main/misc/envdemo.sh
   "GitHub — Incus Data / Shell Scripting First / Miscellaneous / envdemo.sh"
[man7-env1]:
   https://man7.org/linux/man-pages/man1/env.1.html
   "man7/env(1) — Run a program in a modified environment" 
[idgh-wiki-variables-env]:
   https://github.com/incusdata/shs1st/wiki/20-Variables#command-variables
   "GitHub — Incus Data / Wiki / Variables / Command Variables"

## [`exitcode.sh`][shs1st-misc-exitcode_sh] — Control Exit Codes

This script demonstrates controlling the [exit code][w-exitcode] (or *status
code*) of the script. It can be passed an exit code to terminate with, as a
[command-line argument][idgh-wiki-concepts-cli-arg]. In lieu of an exit code
argument, it will check for an exit code in the `EXIT_CODE` environment
variable. If that does not exits, it will return **`0`**.

For safety, the exit code is returned in a sub-shell. If sourcing the script is
never going to take place, the script can be made more efficient by removing the
parentheses around the **`exit`** command (i.e., the sub-shell).

```sh
$ . ./exitcode.sh 123;               echo $?
$ sh  exitcode.sh 123;               echo $?
$ env EXIT_CODE=123 sh exitcode.sh;  echo $?
$ sh exitcode.sh;                    echo $?
```

This will output `123`, `123`, `123`, and finally: `0`.

[idgh-wiki-concepts-cli-arg]:
   https://github.com/incusdata/shs1st/wiki/01-Basic-Concepts#command-line-arguments
   "GitHub — Incus Data / Shell Scripting First / Wiki / Basic Concepts / Command-Line Arguments"
[shs1st-misc-exitcode_sh]:
   https://github.com/incusdata/shs1st/blob/main/misc/exitcode.sh
   "GitHub — Incus Data / Shell Scripting First / Miscellaneous / exitcode.sh"
[w-exitcode]:
   https://en.wikipedia.org/wiki/Exit_status
   "Wikipedia — Exit Status"

## [`getopt_demo.sh`][shs1st-misc-getopt_demo_sh] — Options Example

Example script that demonstrates a pattern for using [**`getopt(1)`**][man7-getopt1] for managing short and long options in a script. Here are some example command-lines to try.

```sh
$ ./getopt_demo.sh -h
$ ./getopt_demo.sh -v -i inputfile.txt
$ ./getopt_demo.sh -vi inputfile.txt -o outfile.txt
$ ./getopt_demo.sh -iinputfile.txt -ooutfile.txt
$ ./getopt_demo.sh ARG1 --verbose ARG2 --output=outfile.txt
```

Note that `getopt` allows you to combine short options like `-vi`, which is actually two options: `-v` and `-i`. The options `-i` and `-o`, if present, require arguments, which can be supplied immediately, or in the next command-line argument.

Arguments, short options, and long options, can appear in any order.

[shs1st-misc-getopt_demo_sh]:
   https://github.com/incusdata/shs1st/blob/main/misc/getopt_demo.sh
   "GitHub — Incus Data / Shell Scripting First / Miscellaneous / getopt_demo.sh"
[man7-getopt1]:
  https://www.man7.org/linux/man-pages/man1/getopt.1.html 
  "man7/getopt(1) — Parse command-line options (enhanced)"

## [`getopts_demo.sh`][shs1st-misc-getopts_demo_sh] — POSIX Options

Example script that demonstrates a pattern for using [**`getopts(1p)`**][man7-getopts1p] for managing short options in a script. Here are some example command-lines to try.

```sh
$ ./getopt_demo.sh -h
$ ./getopt_demo.sh -v -i inputfile.txt
$ ./getopt_demo.sh -vi inputfile.txt -o outfile.txt
$ ./getopt_demo.sh -iinputfile.txt -ooutfile.txt
$ ./getopt_demo.sh -v -o outfile.txt ARG1 ARG2
```

Note that `getopts` allows you to combine short options like `-vi`, which is actually two options: `-v` and `-i`. The options `-i` and `-o`, if present, require arguments, which can be supplied immediately, or in the next command-line argument.

Arguments not associated with options, may follow the options, as long as the script has removed the options from `$@` with: `shift $((OPTIND-1))`.

[shs1st-misc-getopts_demo_sh]:
   https://github.com/incusdata/shs1st/blob/main/misc/getopts_demo.sh
   "GitHub — Incus Data / Shell Scripting First / Miscellaneous / getopts_demo.sh"
[man7-getopts1p]:
  https://www.man7.org/linux/man-pages/man1/getopts.1p.html 
  "man7/getopts(1p) — Parse short command-line options"


## [`line_by_line.sh`][shs1st-misc-line_by_line_sh] — Process Input Line-by-Line

This script combines topics from [`process_lines.sh`][shs1st-snip-process_lines] and
[`stdin_or_file.sh`][shs1st-snip-stdin_or_file], but does not use [**`cat(1p)`**][man7-cat1p]. Instead, it uses [**`exec(1p)`**][man7-exec1p] to open a file as standard input. Note that `exec < …` ≡ `exec 0< …`.

This way, even if the input is from standard input, we can process one line, before we read the next line. This read/process sequence will continue until end-of-file.

If maximum portability is not a major concern, we can use the `/dev/stdin` ‘file’, available on all Linux systems. Shells like **`bash`** and **`ksh`** will simulate `/dev/stdin` (for scripts only), where it is not available. Use of [**`exec`**][man7-exec1p] is quite efficient, so there is little incentive not to use it.

```sh
if [ -z "$1" ]; then src=/dev/stdin; else src="$1"; fi
...
while IFS= read -r line; do
   process_line "$line"
done < "$src"
```

Or, leave the `src` variable *unset* for the standard input scenario; then use variable brace expansion or [**parameter expansion**][og-misc-shcmd-parm-exp]:

```sh
if [ -n "$1" ]; then src="$1"; fi
...
while IFS= read -r line; do
   process_line "$line"
done < "${src:-/dev/stdin}"
```

[shs1st-misc-line_by_line_sh]:
   https://github.com/incusdata/shs1st/blob/main/misc/line_by_line.sh
   "GitHub — Incus Data / Shell Scripting First / Miscellaneous / line_by_line.sh"
[shs1st-snip-process_lines]:
   https://github.com/incusdata/shs1st/tree/main/snip#process_linessh--line-wise-processing
   "GitHub — Incus Data / Shell Scripting First / Snippets / Line-Wise Processing"
[shs1st-snip-stdin_or_file]:
   https://github.com/incusdata/shs1st/tree/main/snip#stdin_or_filesh--read-standard-input-or-file 
   "GitHub — Incus Data / Shell Scripting First / Snippets / Line-Wise Processing"
[man7-cat1p]:
   https://man7.org/linux/man-pages/man1/cat.1p.html
   "man7/cat(1p) — Concatenate and print files"
[man7-exec1p]:
   https://man7.org/linux/man-pages/man1/exec.1p.html
   "man7/exec(1p) — Execute commands and open, close, or copy file descriptors"
[og-misc-shcmd-parm-exp]:
   https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02
   "POSIX — Utilities / Shell Command Language # 2.6.2 Parameter Expansion"

## [`showargs.sh`][shs1st-misc-showargs_sh] — Show Script Arguments 

Arguments passed to a script and other information, is available in several ‘special’ variables or [**parameters**][og-misc-shcmd-parms].

 * **`$#`** &nbsp; ← &nbsp; number of arguments.
 * **`$*`** &nbsp; ← &nbsp; expands in all arguments.
 * **`$@`** &nbsp; ← &nbsp; expands in all arguments, quoted.
 * **`$0`** &nbsp; ← &nbsp; name of the script. 
 * **`$N`** &nbsp; ← &nbsp; argument { `N` ∈ `1` … `9` }.

This script demonstrates several ways to process its command-line arguments. 

[shs1st-misc-showargs_sh]:
   https://github.com/incusdata/shs1st/blob/main/misc/showargs.sh
   "GitHub — Incus Data / Shell Scripting First / Miscellaneous / showargs.sh"
[og-misc-shcmd-parms]:
   https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_05_02
   "POSIX — Utilities / Shell Command Language # 2.5.2 Special Parameters"

## [`special_chars.sh`][shs1st-misc-special_chars_sh] — Show Shell Special Characters

This is a [POSIX][w-posix] script that prints shell special characters (or 
[*meta-characters*][bash-def-metachr]) in three ways, by …

 * using shell [escape characters][bash-syn-escape] (**`\`**);
 * using [single quote][bash-syn-squote] delimited strings (**`'`** … **`'`**);
 * using [double quote][bash-syn-dquote] delimited strings (**`"`** … **`"`**). 

The script contains literal ASCII ESCape characters (`0x1B`/`27`), which may be
displayed as `^[`, depending on your editor. GitHub will not show the ESC
characters. These sequences facilitate controlling the terminal using
[ANSI/VT100 escape codes][w-ansi-esc].

[shs1st-misc-special_chars_sh]:
   https://github.com/incusdata/shs1st/blob/main/misc/special_chars.sh
   "GitHub — Incus Data / Shell Scripting First / Miscellaneous / special_chars.sh"
[bash-syn-escape]:
   https://www.gnu.org/software/bash/manual/bash.html#Escape-Character
   "Bash Manual — Escape Character"
[bash-syn-squote]:
   https://www.gnu.org/software/bash/manual/bash.html#Single-Quotes
   "Bash Manual — Single Quotes"
[bash-syn-dquote]:
   https://www.gnu.org/software/bash/manual/bash.html#Double-Quotes 
   "Bash Manual — Double Quotes"
[bash-def-metachr]:
   https://www.gnu.org/software/bash/manual/bash.html#index-metacharacter
   "Bash Manual — Definitions # metacharacter"
[w-ansi-esc]:
   https://en.wikipedia.org/wiki/ANSI_escape_code
   "Wikipedia — ANSI Escape Code"
[w-posix]:
   https://en.wikipedia.org/wiki/POSIX
   "Wikipedia — POSIX"

## [`whichshell.sh`][shs1st-misc-whichshell_sh] — Show System, Login & Script Shells

This script prints out paths to to the *system shell*; the user's *login shell*, and the shell which is interpreting the script. The system shell is represented by **`sh`**, which is a symbolic link to the *real* system shell. The user's login shell is in the `SHELL` environment variable. An *interactive* shell's name will be in **`$0`**.

It gets more tricky to find the shell that is *interpreting* the script. The script makes use of the [**/proc/**‹PID›][lkd-procfs-pid] process subdiretory in the `/proc` pseudo filesystem. It contains process-specific information, and the **`exe`** entry provides the location of the process executable (shell).

The script makes use of [**`readlink(1)`**][man7-readlink1], [**`which`**][ss64-which], and [**`whoami(1)`**][man7-whoami1] (although the latter has nothing to do with finding the shells).  Using [**`readlink -f`**][man7-readlink1] would simplify some nested command substitutions.

[shs1st-misc-whichshell_sh]:
   https://github.com/incusdata/shs1st/blob/main/misc/whichshell.sh
   "GitHub — Incus Data / Shell Scripting First / Miscellaneous / whichshell.sh"
[lkd-procfs-pid]:
   https://www.kernel.org/doc/html/latest/filesystems/proc.html#process-specific-subdirectories
   "Linux Kernel Docs — The /proc Filesystem"
[man7-readlink1]:
   https://man7.org/linux/man-pages/man1/readlink.1.html
   "man7/readlink(1) — Print resolved symbolic links or canonical file names"
[ss64-which]:
   https://ss64.com/bash/which.html
   "ss64/Bash — which — Locate a program file in the user's PATH"
[man7-whoami1]:
   https://man7.org/linux/man-pages/man1/whoami.1.html
   "man7/whoami(1) — Print effective user name"
