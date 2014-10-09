#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw( reduce ); 

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

        print "$i : $sum : $number_of_factors\n";

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

my $args = @ARGV;

my ( $start, $finish ) = @ARGV; 

if ( !$args ) {
    print "  usage: ./tri.pl [start] [end]\n"; 
    print "example: ./tri.pl 1 28\n"; 
    print "example: ./tri.pl 1000 2000\n"; 
    exit;
}

triangular_number_sum( $start, $finish ); 
