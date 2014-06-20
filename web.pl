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

sub get_access_count {
    my $ip = shift;
    my $count = grep( /$ip/, @ips );
    return $count;
}

sub get_hostname {
    my $ip = shift;
    my $host = gethostbyaddr( inet_aton( $ip ), AF_INET );
    return $host;
}

sub main {
    get_iplist();
    my %ips_counts = ();
    for my $ip ( @ips ) {
        my $count = get_access_count( $ip );
        $ips_counts{ $ip } = $count unless exists $ips_counts{ $ip };
    }

    foreach my $key ( sort { $ips_counts{ $b } <=> $ips_counts{ $a } } keys %ips_counts ) {
        my $host = get_hostname( $key );
        if ( $ips_counts{ $key } and $key and $host ) {
            printf( "%-10s - %-20s - %s\n", $ips_counts{ $key }, $key, $host );
        }
    }
}
