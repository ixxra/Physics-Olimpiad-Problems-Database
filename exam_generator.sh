#!/bin/bash
#
#exam_generator.sh <year>  given a year... generate a .tex file with that year IPHO 
#theoretical examination... and copies the needed figures to the current folder
#

exam_year=$1

cat<<EOF 
\documentclass[10pt,a4paper]{amsart}
\usepackage{graphicx}
\usepackage[utf8]{inputenc}
\usepackage{float}
\usepackage{array}
\usepackage{amssymb}
\usepackage{textcomp}
\usepackage[spanish,activeacute]{babel}

\theoremstyle{definition}
\newtheorem{prob}{Problema}

\usepackage[letterpaper]{geometry}
\geometry{verbose,tmargin=2.5cm,bmargin=2.5cm,lmargin=2.5cm,rmargin=2.5cm}

\title{Prueba teórica de la olimpiada estatal de física de $exam_year}

\begin{document}
\maketitle
EOF

find $exam_year -name 'P*prob' | sort | sed 's@/@ @g' | while read year problem fname; do

    cp $year/$problem/$year-$problem-* .
    cat $year/$problem/$fname

done
echo '\end{document}'
