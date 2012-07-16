#!/usr/bin/env python
"""
batch_insert.py    <database> <insert stmt>    opens database and inserts

a comma separated list of values read from stdin
"""

import sys
import fileinput
import sqlite3


DATABASE = sys.argv[1]
INSERT_STM = sys.argv[2]

#print ('database:', DATABASE)
#print ('insert: ', INSERT_STM)

args = []

with fileinput.input(files=('-')) as f:
    for line in f:
        args.append (tuple([w.strip() for w in line.split(',')]))

conn = sqlite3.connect (DATABASE)
cur = conn.cursor ()        

cur.executemany(INSERT_STM, args)
conn.commit()
cur.close ()
