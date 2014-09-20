#!/usr/bin/env bash
#
# [Short description of program or file]
# Showcase my personal bash style guide.
# [if it's in the usage message, is it necessary?]
#
# [Copyright (C) year name-of-author-1 <email>]
# [Copyright (C) year name-of-author-2 <email>]
# Copyright (C) 2014 Ben Orchard <thefirstmuffinman@gmail.com>
#
# [If appropriate, put a boilerplate notice here, e.g.:]
# [Do I actually want this? Consider more.]
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
# USA
#

usage() {
    cat <<EOF
Usage: ${0##*/} [options] file
Showcase my personal base style guide.

  Options:
    -e          display an error message
    -h          display this help message

Need to consider indentation: it's all random, but GNU stuff usually uses
1-space indentation. No tabs ever, obviously.
EOF
}

while getopts "eh" opt; do
    case $opt in
        e) # display an example error message
            echo "${0##*/}: can't show error message: not enough money"
            ;;
        h) # display usage message
            usage
            exit 0
            ;;
    esac
done



echo "The [[ and == are both bashisms. If == is used, you must also use "
echo "double brackets, else it will fail. The double brackets let bash do "
echo "a ton of cool things like globbing and such, so they're pretty fine."

echo "Notice 'trailing' comment lines and plenty of spacing. Keeps it neat, "
echo "y'know?"
echo "Yeah, long echos aren't great. I figure by doing what I'm doing, "
echo "making new lines every 80 columns in the code, we're always wrapping to "
echo "terminals nicely. I mean, what sort of terminal is smaller than 80 "
echo "columns?"
echo
echo "Still, please check how other people do this. My way probably isn't the "
echo "best way. Could just make it all one big line using backslashes, and it "
echo "would still look good in the code."

# Heredocs, short for 'here documents' (etymology unknown by me).
# These are parts of the file which, according to Wikipedia, are "treated as if
# it were a separate file". It's an easy way to embed big, multi-line,
# formatted strings in a file. bash and PHP at least allow variable
# substitution to go on in a here document, so consider it like a docstring in
# Python (note: it actually might be pretty much that:
# http://stackoverflow.com/questions/9589301/).
#
# I use heredocs to make nice, readable, preformatted usage messages. See the
# usage message in this script for an example.
