#!/usr/bin/perl

use strict;
use warnings;

my @vlans = qw( 10.22.23/23 10.21.74/24 );

for ( @vlans ) {
    if ( /10\.22\.23/  ) {
        for ( my $i = 22; $i < 24; $i++ ) {
            for ( my $j = 2; $j < 256; $j++ ) {
                my $system = `/usr/bin/host 10.22.$i.$j`;
                if ( $system !~ /NXDOMAIN/ ) {
                    my @foo = split( " ", $system );
                    my $hostname = $foo[4];
                    print "10.22.$i.$j    $hostname\n";
                }
            }
        }
    }

    if ( /10\.21\.74/ ) {
        for ( my $i = 2; $i < 256; $i++ ) {
            my $system = `/usr/bin/host 10.21.74.$i`;
            if ( $system !~ /NXDOMAIN/ ) {
                my @foo = split( " ", $system );
                my $hostname = $foo[4];
                print "10.21.74.$i    $hostname\n"; 
            }
        }
    }
}


