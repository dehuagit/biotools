#!/usr/bin/python
#
# Aussume the fasta is the two post
# example 
# 
import sys
import re

file_name = sys.argv[1]
min_NNumber = int(sys.argv[2])


# header content
print "Header\tCoordinate\tNumber Of N"


# open the file
FH = open(file_name, 'r')

for line in FH:
  cline = line.rstrip('\n')
  pattern = re.compile('^>')
  if (pattern.search(cline)):
    cur_NNumber = 0
    cur_Position = 1
    header = cline
  else:
    # count the n number
    for c in cline:
      if c == "N" or c == "n":
        cur_NNumber += 1
      else:
        if cur_NNumber >= min_NNumber:
          print header,"\t",cur_Position - cur_NNumber,"\t",cur_NNumber
          cur_NNumber = 0
      cur_Position += 1
    else:
      if cur_NNumber >= min_NNumber:
        print header,"\t",cur_Position - cur_NNumber,"\t",cur_NNumber
        cur_NNumber = 0


FH.close()





