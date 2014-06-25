#!/usr/bin/perl

use strict;
use warnings;
use Memoize;

memoize 'fib';

sub fib {
    my $n = shift;
    return 1 if $n <= 2;
    return fib( $n-1 ) + fib( $n-2 ); 
}

for ( my $i = 0; $i < 100; $i++ ) {
    print fib($i), "\n"; 
}
