#!/usr/bin/perl

use strict;
use warnings;

my @files = glob('*');
my @sizes = map -s, @files;
my %files_sizes = ();
@files_sizes{@files} = @sizes;
for my $key ( reverse sort { $files_sizes{$a} <=> $files_sizes{$b} } keys %files_sizes ) {
    printf "%-40s %20s\n", $key, $files_sizes{$key};
}


