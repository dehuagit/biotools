#!/usr/bin/perl

use warnings;
use strict;

my $fastaFile = shift;

open (FASTA, "<$fastaFile");

my $c_sum = 0;
my $g_sum = 0;
my $t_sum = 0;
my $a_sum = 0;
my $all_length = 0;
my $line_index=0;

while (my $line = <FASTA>) {
	chomp $line;

	my $seq = $line;
	if ($line_index % 4 == 1) {
	#	print "seq: $seq"."\n";
		$all_length = $all_length + length($seq);
		my $c = ($seq=~tr/C//);
		my $t = ($seq=~tr/T//);
		my $g = ($seq=~tr/G//);
		my $a = ($seq=~tr/A//);
		$c_sum = $c_sum + $c;
		$g_sum = $g_sum + $g;
		$t_sum = $t_sum + $t;
		$a_sum = $a_sum + $a;
	}

	$line_index = $line_index + 1;
}

my $n_sum = $all_length - $c_sum - $g_sum - $t_sum - $a_sum;

print "Total bases: ".$all_length."\n";
print "C bases: ".$c_sum.", rate: ".$c_sum/$all_length."\n";
print "G bases: ".$g_sum.", rate: ".$g_sum/$all_length."\n";
print "T bases: ".$t_sum.", rate: ".$t_sum/$all_length."\n";
print "A bases: ".$a_sum.", rate: ".$a_sum/$all_length."\n";
print "N or other small bases: ".$n_sum."\n";







