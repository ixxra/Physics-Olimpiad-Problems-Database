#!/usr/bin/env python 
"""
distinct.py    prints different words from  stdin  
"""

import sys
import fileinput

words = set ()

for line in fileinput.input ():
    words.update(line.strip().split())

for word in words:
    print (word)


