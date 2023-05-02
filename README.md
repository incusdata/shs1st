<a id="shs1st"></a>
<div align="center" width="100%">
<a href="http://github.com/incusdata/shs1st/wiki"
   title="GitHub - Incus Data / Shell Script First / Wiki"
   ><img src="./res/shs1st-cut.svg?raw=true" alt="Shell Script First Wiki"/></a>
<br/>
<h3 align="center"><h3>Repository for Shell Scripting Matters</h3>
</div>
<br/>

Shell Script First Repository. A collection of shell script examples, and a
[wiki][shs1st-wiki] detailing some commands and [command-line][w-cli] topics.

We welcome your participation; raise an [issue](https://github.com/incusdata/shs1st/issues), or submit a [pull request](https://github.com/incusdata/shs1st/pulls).

-----

The example shell scripts are split into several directories:

 * [**misc**](misc/) — Uncategorised scripts.
 * [**snip**](snip/) — Re-usable, or educational snippets.

## [&#x21EA;](#shs1st) POSIX Compliance

We pay particular attention to the POSIX [IEEE Std 1003.1-2017][posix-shell] specification (Shell & Utilities). Unless explicitly stated, scripts and example extracts are POSIX-compliant. Such scripts will have the following [shebang][w-shebang] (or *hash-bang*) line:

&nbsp;&nbsp;&nbsp;&nbsp; `#/usr/bin/env sh`

Scripts that are intended to illustrate shell-specific features, will have that particular shell's name in place of the `sh`.

Writing POSIX-compliant scripts increases their portability across Linux distributions and Unix variants. However, if your target is Linux and you’re using shells like **bash**, **zsh** or **ksh** (Korn Shell), you may choose to take advantage of their useful and convenient extensions rather than limiting yourself to POSIX compliance.

[posix-shell]:
   https://pubs.opengroup.org/onlinepubs/9699919799/utilities/contents.html
   "POSIX — Shell & Utilities: Detailed TOC"
[w-shebang]:
   https://en.wikipedia.org/wiki/Shebang_(Unix)
   "Wikipedia — Shebang (Unix)"

## [&#x21EA;](#shs1st) POSIX-Compliant Features

| feature                                | description                    |
|:---------------------------------------|:-------------------------------|
| **`$(‹command›)`**                     | Command substitution (alternative: **`` `‹command›` ``**). |
| **`(‹command›)`**                      | Run command(s) in subshell. |
| **`$((‹expr›))`**                      | Arithmetic expansion. |
| **`${‹var›#‹pattern›}`**               | Prefix removal. Also `##` (for longest). |
| **`${‹var›%‹pattern›}`**               | Postfix removal. Also `%%` (for longest). |
| **`[‹args›]`**                         | Tests. Alias for `test`. |
| **`set -e`**                           | Error handling. |
| **`trap`**                             | Signal handling. |
| **`case`**                             | Pattern matching. End with `esac`. |
| **`shift`**                            | Remove (pop) argument. |
| **`for`**, **`while`**, **`until`**    | Iteration statements. End with `done`. |
| **`if`** … **`elif`** … **`fi`**       | If statement. |
| **`;`**, **`&&`**, **`\|\|`**          | Command sequencing. |
| **`\|`**, **`<`**, **`>`**, **`>>`**   | Piping and redirection. |
| **`command`**                          | Bypass aliases. |
| **`exec`**                             | Replace process or duplicate file descriptors. |
| **`${‹var›:=‹default›}`**              | Set default value for unset variables. |
| **`export`**                           | Make variables available to sub-processes. |
| **`return`**                           | Exit code for functions. |
| **`exit`**                             | Exit code for process or script. |
| **`getopts`**                          | Short option parsing. |
| **`IFS`**                              | Field splitting delimiters. |
| **`HOME`**                             | User's home directory. |
| **`PATH`**                             | Executable directory list. |
| **`LC…`**                              | Locale variables. |
| **`<< ‹mark>`**                        | Here documents. |
| **`<< '‹mark>'`**                      | Here documents without expansions. |

## [&#x21EA;](#shs1st) Shell Extensions 

| feature                                | description                    |
|:---------------------------------------|:-------------------------------|
| **`<(‹command›))`**                    | Process substitution. |
| **`((‹expr›))`**                       | Arithmetic evaluation. |
| **`[[‹expr›]]`**                       | Extended `test` command. |
| **`${‹var›/‹patt›/‹replace›}`**        | Subtitution. |
| **`for((‹init›;‹cond›;‹augm›))`**      | C-style for loop. |
| **`local`**                            | Local variables in functions. |
| **`readonly`**                         | Create constants. |
| **`getopt`**                           | Short & long option parsing. |
| **`<< $‹var›`**                        | Use variable content for marks. | 
| **`<<- ‹mark›`**                       | Strip one leading ‹TAB›. | 
| **`<<< ‹string›`**                     | Bash ‘here strings’. |
| **`mktemp`**                           | Reliable temporary filenames. |
| **`$'…'`**                             | ANSI-C quoting. |
| **`echo -e`**                          | Parse C escape sequences. |
| **`echo -n`**                          | Omit automatic newline. |

## [&#x21EA;](#shs1st) Some Resources

A non-exhaustive list of curated shell scripting and general command-line
online resources.
 
 * [Bash Reference Manual][bash-ref] — The source of truth (for Bash, at least).

 * [Advanced Bash-Scripting Guide (2014)][avbsg] — Still useful; also available as a [PDF file][avbsg-pdf].

 * [The Linux Command Line -5ed (2019)][lcmd-tlcl]; William Shotts — Available as a free PDF, or as a printed version from No Starch Press. See home page for links.

 * [ShellCheck][shchk-home] — Online version of a shell script ‘[linter][w-lint]’ (downloadable from [GitHub][shchk-gh], or via your package manager).

 * [Shell Scripting Tutorial][shstut] — A free online Bourne shell tutorial, with optional PDF purchase.

 * [Effective Shell][eff-shell] — Covers **bash** command-line and light shell scripting.

 * [Online Help Resources][idgh-shs1st-wiki-home-online-res] — Online **man** pages and documentation resources list on this repository's wiki.

| &#x002A;&#xFE0F;&#x20E3; **DISCLAIMER** |
| :-------------------------------------- |
| We do not claim suitability of these resources for your requirements. No affiliation with associated individuals, groups, companies, or ideologies, exists. We do not necessarily endorse, nor are we endorsed by, any of the aforementioned. ([WANL](## "We Are Not Lawyers")) |

[avbsg]:
   https://tldp.org/LDP/abs/html/"
   "TLDP — Advanced Bash-Scripting Guide (html)"
[avbsg-pdf]:
   https://tldp.org/LDP/abs/abs-guide.pdf?ref=its-foss
   "TLDP — Advanced Bash-Scripting Guide (pdf)"
[bash-ref]:
   https://www.gnu.org/software/bash/manual/bash.html
   "GNU — Bash Reference Manual"
[shs1st-wiki]:
   https://github.com/incusdata/shs1st/wiki
   "GitHub — incusdata/shs1st.wiki Home Page"
[w-cli]:
   https://en.wikipedia.org/wiki/Command-line_interface
   "Wikipedia — Command-Line Interface"
[lcmd-tlcl]:
   http://www.linuxcommand.org/tlcl.php
   "The Linux Command Line (home page)"
[shchk-home]:
   https://www.shellcheck.net/?ref=its-foss#
   "ShellCheck — Online shellcheck for scripts"
[shchk-gh]:
   https://github.com/koalaman/shellcheck
   "GitHub — ShellCheck"
[shstut]:
   https://www.shellscript.sh/
   "Shell Scripting Tutorial (Bourne Shell)"
[w-lint]:
   https://en.wikipedia.org/wiki/Lint_(software)
   "Wikipedia — Lint (software)"
[eff-shell]:
   https://effective-shell.com/
   "Effective Shell"
[idgh-shs1st-wiki-home-online-res]:
   https://github.com/incusdata/shs1st/wiki#online-help
   "GitHub — Incus Data / Shell Scripting First / Wiki / Online Help"
