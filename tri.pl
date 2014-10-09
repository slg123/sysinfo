#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw( reduce ); 

sub triangular_number_sum {
    my $upto = shift;
    for my $i ( 1 .. $upto ) {
        my @t; 
        my $sum; 
        for ( my $j = $i; $j > 0; $j-- ) {
            push @t, $j;
        }
        for ( @t ) {
            $sum = reduce { our $a + our $b } @t;
        }
        my @f = factors( $sum ); 
        my $number_of_factors = @f; 

        if ( $number_of_factors > 100 ) {
            print "$i : $sum : $number_of_factors\n";
        }

        if ( $number_of_factors > 500 ) {
            print "FOUND => $i : $sum : $number_of_factors\n";
            exit;
        }
    }
}

sub factors { 
    my $n = shift;
    return grep { $n % $_ == 0 } ( 1 .. $n ); 
}

# this blows up for very large N
triangular_number_sum( 1000000000 ); 
