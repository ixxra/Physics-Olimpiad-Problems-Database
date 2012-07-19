#!/bin/bash
#
#exam_generator.sh <year>  given a year... generate a .tex file with that year IPHO 
#theoretical examination... and copies the needed figures to the current folder
#

exam_year=$1

#TODO: This is nasty... and error prone... check if you can 
#figure out a better way to generate header info
OLD_IFS="$IFS"
IFS=','
declare -a line=( $(grep $exam_year ipho-host-countries) )
 number=${line[0]}
   year=${line[1]}
country=${line[2]}
   city=${line[3]}
IFS="$OLD_IFS"


cat<<EOF 
\documentclass[10pt,a4paper]{amsart}
\usepackage{graphicx}
\usepackage[utf8]{inputenc}
\usepackage{float}
\usepackage{array}
\usepackage{enumerate}
\usepackage{amssymb}
\usepackage{textcomp}
\usepackage[spanish,activeacute]{babel}

\theoremstyle{definition}
\newtheorem{prob}{Problema}

\usepackage[letterpaper]{geometry}
\geometry{verbose,tmargin=2.5cm,bmargin=2.5cm,lmargin=2.5cm,rmargin=2.5cm}

\title{$number Olimpiada Internacional de Física\\\\
 $city, $country, $year}

\begin{document}
\maketitle
EOF

find $exam_year -name 'P*prob' | sort | sed 's@/@ @g' | while read year problem fname; do

    cp $year/$problem/$year-$problem-* .
    cat $year/$problem/$fname

done
echo '\end{document}'
