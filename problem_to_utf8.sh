#!/bin/bash
#
#problem_to_utf8.sh converts .tex.old files (encoded in latin1) to utf8 
#(same name... with .tex extension)
#


find -name '*tex.old' -printf '%h %f\n' | while read dname fname; do
    target=${fname%.old}
    python iconv.py $dname/$fname | sed 's/latin1/utf8/;/latin1/q' > $dname/$target
done
