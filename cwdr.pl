#!/usr/local/bin/perl

use strict;
use warnings;

my @files = glob('*');
my @sizes = map -s, @files;
my %files_sizes = ();
@files_sizes{@files} = @sizes;
for my $key ( reverse sort { $files_sizes{$a} <=> $files_sizes{$b} } keys %files_sizes ) {
    printf "%-55s %.2f MB\n", $key, size_in_mb( $files_sizes{$key} );
}

sub size_in_mb {
    my $size_in_bytes = shift;
    return $size_in_bytes / ( 1024 * 1024 ); 
}


