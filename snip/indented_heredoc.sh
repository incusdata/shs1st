#!/usr/bin/env sh
#
# Indented here documents (heredocs) start with: ‘`<<-` ‹mark›’.
# All leading *hard TABs* will be removed. The end ‹mark› can
# be indented, or not. This script shows various possibilities.
# None of the output results will have any leading indentation.
#
cat <<- EOF
	1) first line
	1) second line
	EOF

cat <<- EOF
	2) first line
	2) second line
		EOF

if true; then
	cat <<- EOF
			3) first line
		3) second line
		EOF
fi

cat <<- EOF
			4) first line
				4) second line
EOF

# vim: noet ts=3 sw=3 sts=3 :
