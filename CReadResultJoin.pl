#!/usr/bin/perl
use strict;
use warnings;

# we assume the CVSR1result and cvs result  
# parameter R1Result R2Result
# method: apend the R2 result to R1

my $R1File=$ARGV[0];
my $R2File=$ARGV[1];

open(my $fh1, '<', $R1File)
  or die "Could not open file '$R1File' $!";


open(my $fh2, '<', $R2File)
  or die "Could not open file '$R2File' $!";

print "#Files: $R1File,$R2File\n";
print "#gene,seq,r1 reads, r2 reads\n";


while (my $row1 = <$fh1>) {
	chomp $row1;
	my $row2 = <$fh2>;
	chomp $row2;

	my @tokens = split /,/, $row2;
	
	print "$row1,$tokens[2]\n";
}





