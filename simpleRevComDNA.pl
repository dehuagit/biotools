#!/usr/bin/perl -w

$DNA = $ARGV[0];

$revcom = reverse $DNA;
$revcom =~ tr/ACGTacgt/TGCAtgca/;

print $revcom;














