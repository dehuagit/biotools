#!/usr/bin/python
#
# example 
# 
import sys
import re

# open file
if len(sys.argv) != 3:
	print sys.argv[0] + " seq_file search_header"
	sys.exit(0)

file_name = sys.argv[1]
filter_header = sys.argv[2]

#print "open file: " + file_name
#print "Filter seq header: " + filter_header



# 
FH = open(file_name, 'r')
filter_flag = 0

for line in FH:
  cline = line.rstrip('\n')
  pattern = re.compile('^>')
  if (pattern.search(cline)):
    if (cline == filter_header):
      filter_flag = 1
    else:
      filter_flag = 0
      print cline
  else:
    if (filter_flag == 0):
      print cline


FH.close()



