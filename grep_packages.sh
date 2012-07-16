#!/bin/bash

find -name '*tex' -exec sed  -r  -n  's/\\usepackage\{(\w+)\}/\1/p'  {} +

