#!/usr/bin/perl 
use strict;
use warnings;

# the fa is simple first string
#>header 
#seq
#>header2
#seq2

my $faFile = $ARGV[0];


open(my $fh, '<', $faFile)
  or die "Could not open file '$faFile' $!";

while (my $row = <$fh>) {
	chomp $row;
	
	if ($row =~ /^>/) {
		 print ("$row\n");
	}
	else {
		print ReverseComplementDNA($row)."\n";
	}


}

sub ReverseComplementDNA {
	
	my ($DNA) = (@_);
	my $revcom = reverse $DNA;
	
	$revcom =~ tr/ACGTacgt/TGCAtgca/;
	
	return $revcom;
}













