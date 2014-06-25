#!/usr/bin/perl

use strict;
use warnings;

sub fib {
    my $n = shift;
    return 1 if $n <= 2;
    return fib( $n-1 ) + fib( $n-2 ); 
}

sub to_minutes {
    my $seconds = shift;
    return $seconds if $seconds < 60;
    return ( $seconds / 60 ); 
}

for ( my $i = 0; $i < 100; $i++ ) {
    my $start = time();
    my $val = fib( $i ); 
    my $finish = time(); 
    my $seconds = $finish - $start;
    if ( $seconds < 60 ) {
        print "$seconds seconds to calculate fib($i): $val\n"; 
    } else {
        my $minutes = to_minutes( $seconds );
        print "$minutes minutes to calculate fib($i): $val\n"; 
    }
}
