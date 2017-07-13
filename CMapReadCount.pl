#!/usr/bin/perl
use strict;
use warnings;
#
# using the csv fa
#

my $csvfilename = $ARGV[0];
my $faFile = $ARGV[1];
my $gene = "";
my $seq = "";

if (! -e "$faFile") {
 die "$faFile not exists!\n" ;
}

open(my $fh, '<', $csvfilename)
  or die "Could not open file '$csvfilename' $!";

while (my $row = <$fh>) {
  chomp $row;
  #print "$row\n";
  my @tokens = split /,/, $row;
  $gene = $tokens[0];
  $seq = $tokens[2];
 
  my $match =  `grep -c $seq $faFile`;

  print "$tokens[0],$tokens[2],$match";
}
