#!/usr/bin/perl

use strict;
use warnings;
use autodie;

#
# Get AIX memory as percentage of system RAM in use.
#
sub get_aix_mem_percent_used {

    my $percent_used = 0;
    my $in_use       = 0;
    my $memory       = 0;

    my $cmd = "svmon -G";
    open my $fh, "-|", $cmd;
    while ( <$fh> ) {
        if ( /memory/ ) {
            my @line = split /\s{2,}/;
            $memory = $line[1];
        }
        if ( /in use/ ) {
            my @line = split /\s{2,}/;
            $in_use = $line[1];
        }
        if ( $memory != 0 ) {
            $percent_used = $in_use / $memory * 100;
        } else {
            $percent_used = "divide by zero error"; 
        }
    }
    return $percent_used;
}

sub get_aix_paging_percent_used {

    my $percent_used = 0;
    my $cmd = "lsps -s";
    open my $fh, "-|", $cmd;
    while ( <$fh> ) {
        if ( /MB/ ) {
            my ( $foo, $size, $percent ) = split /\s+/;
            $percent_used = substr( $percent, 0, -1 );
        }
    }
    return $percent_used;
}

sub main() {
    my $pct_mem_inuse = get_aix_mem_percent_used();
    my $pct_paging    = get_aix_paging_percent_used();
    printf "memory: %0.2f percent \npaging: %0.2f percent\n", $pct_mem_inuse, $pct_paging;
}
main();
