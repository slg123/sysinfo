#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw( reduce ); 
use Memoize;

memoize( 'factors' );
memoize( 'triangular_number_sum' ); 

sub triangular_number_sum {
    my $start  = shift;
    my $finish = shift;
    for my $i ( $start .. $finish ) {
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

my $start  = 16000;
my $finish = 35000;
#my $start = 1;
#my $finish = 1000;


triangular_number_sum( $start, $finish ); 
