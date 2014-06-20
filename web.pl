#!/usr/bin/perl

use strict;
use warnings;
use autodie;
use Socket;

my @ips;
my $access_log = "/var/log/httpd/access_log";

sub get_iplist {
    open my $fh, "<", $access_log;
    while ( <$fh> ) {
        my @line = split ' ', $_;
        push @ips, $line[0];
    }
    close $fh;
}

sub main {
    get_iplist();
    my %ips_counts = ();
    for my $ip ( @ips ) {
        my $count = grep( /$ip/, @ips ); 
        $ips_counts{ $ip } = $count unless exists $ips_counts{ $ip };
    }

    foreach my $key ( sort { $ips_counts{ $b } <=> $ips_counts{ $a } } keys %ips_counts ) {
        my $host = gethostbyaddr( inet_aton( $key ), AF_INET );
        if ( $ips_counts{ $key } and $key and $host ) {
            printf( "%-10s - %-20s - %s\n", $ips_counts{ $key }, $key, $host );
        }
    }
}
