#!/usr/bin/perl

use strict;
use warnings;

my @vlans = qw( 10.22.23/23 10.21.74/24 );
my %ips_hosts = ();

sub build_ip_hosts_list {
    for ( @vlans ) {
        if ( /10\.22\.23/  ) {
            for ( my $i = 22; $i < 24; $i++ ) {
                for ( my $j = 2; $j < 256; $j++ ) {
                    my $system = `/usr/bin/host 10.22.$i.$j`;
                    if ( $system !~ /NXDOMAIN/ ) {
                        my @foo = split( " ", $system );
                        my $hostname = substr( $foo[4], 0, -1 );
                        my $ip = "10.22.$i.$j";
                        $ips_hosts{ $ip } = $hostname; 
                    }
                }
            }
        }

        if ( /10\.21\.74/ ) {
            for ( my $i = 2; $i < 256; $i++ ) {
                my $system = `/usr/bin/host 10.21.74.$i`;
                if ( $system !~ /NXDOMAIN/ ) {
                    my @foo = split( " ", $system );
                    my $hostname = substr( $foo[4], 0, -1 );
                    my $ip = "10.21.74.$i";
                    $ips_hosts{ $ip } = $hostname; 
                }
            }
        }
    }
}

sub print_ip_hosts {
    while ( my ( $key, $value ) = each %ips_hosts ) {
        printf "%-25s    %-30s\n", $key, $value;
    }
}

sub main {

    # Build a list of all ips and hosts.
    build_ip_hosts_list();

    # Print the list we just built.
    print_ip_hosts();

}

main()
