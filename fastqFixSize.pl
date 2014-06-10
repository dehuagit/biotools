#!/usr/bin/perl 
####
use strict;
use warnings;

my $USAGE="Parameter: fasta_file [fix_length]";

if ($#ARGV + 1 < 1) {
        print "Error:".$USAGE;
        exit;
 }

# paramter and put it
my $fa_file=$ARGV[0];
my $fix_length=$ARGV[1];
my %seq_hash;
my $header=undef;
my $sequence=undef;

# open file and read it to a line 
open (FH, $fa_file) || die "Can't open file $fa_file";

while (my $line = <FH>) {
	chomp $line;
	
		
	if ($line =~ /^>/) {
		if (defined($sequence)) {
			$seq_hash{$header}=$sequence;
			$sequence = undef;
		} 
		$header = $line;
	}
	else {
		$sequence = $sequence.$line;
	}

}

if (defined($sequence)) {
          $seq_hash{$header}=$sequence;
          $sequence = undef;
} 


close(FH);


# cut the line to fix lengh

#foreach my $key (keys %seq_hash) {
#print "$key\n";
#print "$seq_hash{$key}\n";
#}

foreach my $key (keys %seq_hash) {
	print "$key\n";
	
	my $str = $seq_hash{$key};
	
	if (defined($fix_length)) {
		my $i;	
		for ($i = 0; $i < length($str); $i += $fix_length) {
			print substr($str, $i, $fix_length)."\n";
		}
	} else {
		print "$seq_hash{$key}\n";
	}
}















