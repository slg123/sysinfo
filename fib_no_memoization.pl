#!/usr/bin/perl

use strict;
use warnings;

sub fib {
    my $n = shift;
    return 1 if $n <= 2;
    return fib( $n-1 ) + fib( $n-2 ); 
}

for ( my $i = 0; $i < 100; $i++ ) {
    my $start = time();
    my $val = fib( $i ); 
    my $finish = time(); 
    my $seconds = $finish - $start;
    print "$seconds seconds to calculate fib($i): $val\n"; 
}
