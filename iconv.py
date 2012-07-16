#!/usr/bin/env python
"""
iconv.py <infile>  - reads a latin1 file and writes to utf8
"""

import sys

with open(sys.argv[1], 'rb') as infile:
    with open('/dev/stdout', 'wb') as outfile:
        for line in infile:
            converted = line.decode('latin1').encode('utf-8')
            outfile.write(converted)

