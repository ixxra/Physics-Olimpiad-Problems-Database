#!/bin/bash
#
#cut_problem  find all .tex.out files and cut each problem environment it finds
#note that you should have used problem_to_utf8.sh and convert_figures.sh first
#

find -name '*tex.out' -printf '%h %f\n' | while read dname fname; do
    target="${fname%.tex.out}.prob"
    sed -n -r '/\\begin\{prob\}/,/\\end\{prob\}/p' < $dname/$fname > $dname/$target
done
