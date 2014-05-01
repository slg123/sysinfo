#!/usr/bin/perl

# sample run...
#
# [root@om ~]# ./coin.pl
# heads: 499967   tails: 500033
#

use strict; 
use warnings;
use POSIX;

my $num_coin_flips = 1000000;
my $heads_counter = 0;
my $tails_counter = 0; 
my $donnie_darko = rand( 28064212 );
srand( $donnie_darko ); 

for ( my $i = 0; $i < $num_coin_flips; $i++ ) {
    my $flip = rand();
    if ( $flip < 0.5 ) {
        $heads_counter++;
    } else {
        $tails_counter++;
    }
}

print "heads: $heads_counter \ttails: $tails_counter\n"; 

