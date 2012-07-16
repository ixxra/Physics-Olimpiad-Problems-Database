#!/bin/bash

find -name '*prob' -printf '%P \n' | sed 's@/@ @g' | while read year problem fname; do
    sed -r "/\\\\includegraphics/s/\{(.+)\}/\{$year-$problem-\1\}/" < $year/$problem/$fname > $year/$problem/$fname.out
done


