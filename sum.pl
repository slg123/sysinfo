#!/usr/bin/perl

use strict;
use warnings;

my @multiples = ();

for ( my $i = 1; $i < 1000; $i++ ) {

    if (( $i % 3 == 0 ) || ( $i % 5 == 0 ) || (( $i % 3 == 0 ) && ( $i % 5 == 0 ))) {
        push @multiples, $i;
    }
}

my $total = 0;
for ( @multiples ) {
    $total += $_;
}
print $total;

