#!/usr/bin/perl
use strict;
use warnings;

my ( $n, $k ) = ( 40, 3 );
my @soldiers = 1 .. $n;
my $pos = 0;

while ( @soldiers > 1 ) {
    $pos = ( $pos + $k - 1 ) % @soldiers;
    splice @soldiers, $pos, 1;
}

print "Winner: Person #@soldiers, alive\n";
