#!/usr/bin/perl

use strict;
use warnings;

# get apache benchmark time for 500 requests

our $time_per_request;

sub get_ab_data {
    my $cmd = "ab -n 500 -c 100 https://om.houqe.lab/ 2>/dev/null"; 
    open my $fh, "-|", $cmd;
    while ( <$fh> ) {
        if ( $_ =~ m/\[ms\] \(mean\)/ ) {
            my @f = split /\s+/, $_; 
            $time_per_request = $f[3]; 
        }
    }
    return $time_per_request;
}

my $runme = 1;
my $counter = 0;
while ( $runme ) {
    if ( $counter == 100 ) {
        exit;
    }
    my $t = get_ab_data(); 
    print $t, "\n"; 
    sleep( 60 ); 
    $counter++;
}
