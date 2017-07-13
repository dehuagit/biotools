#!/bin/bash


fastq=$1

gzip -cd $1 | sed -n '1~4s/^@/>/p;2~4p'  >  $1.fa



