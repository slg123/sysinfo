#!/usr/local/bin/perl

use strict;
use warnings;
use Parse::Netstat qw( parse_netstat ); 
use autodie;

my $output = `netstat -anp`;
my $res = parse_netstat( output => $output ); 

my $parsed = $res->[2]; 
my $conns = $parsed->{ 'active_conns' };
my $num_connections = @$conns;

print "there are: $num_connections connections\n";

for ( my $i = 0; $i < $num_connections; $i++ ) {
    my $active_connections = @$conns[$i];
    while ( my ( $key, $value ) = each %$active_connections ) {
        print "$key $value\n", if $key =~ /foreign_host/;
    }
}

