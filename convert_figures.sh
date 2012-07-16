#!/bin/bash
#
# convert_figures.sh  converts .tex files maping \includegraphics filenames... you should have used 
# problem_to_utf8.sh before and renamed the figures 
#

find -name '*tex' -printf '%P\n' | sed 's@/@ @g' | while read year problem fname; do
    target=$fname.out

    sed -r "/\\\\includegraphics/s/\{(.+)\}/\{$year-$problem-\1\}/" < $year/$problem/$fname > $year/$problem/$target
done
