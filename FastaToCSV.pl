#!/usr/bin/perl 


use strict;
use warnings;


my $faFile = $ARGV[0];

open(my $fh, '<', $faFile)
  or die "Could not open file '$faFile' $!";

while (my $row = <$fh>) {
        chomp $row;
	
	if ($row =~/^>/){
		print $row.",";
	}
	else {
		print $row."\n";
	}

}





#
