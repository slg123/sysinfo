#!/usr/bin/env perl

# ipsort.pl - sort list of currently connected IP addresses.

use strict;
use warnings;
use autodie;

use Socket 'inet_aton';
use List::MoreUtils 'apply';

my $cmd = "/bin/netstat -na";
my $visitors = "visiting_ips.txt";
open my $ofh, ">", $visitors;
open my $fh, "-|", $cmd;
while ( <$fh> ) {
    if ( /ESTABLISHED/ ) {
        my ( $proto, $recv_q, $send_q, $local_addr, $foreign_addr, $state ) = split ' ';
        my ( $addr, $port ) = split ':', $foreign_addr;
        print $ofh "$addr\n";
    }
}
close $fh;
close $ofh;

open my $ifh, "<", $visitors or die "can't open $!";
my @sorted = map { substr($_, 4) }
             sort
             map { inet_aton($_) . $_ }
             apply { chomp }
             <$ifh>;

close $ifh;
for my $ip ( @sorted ) {
    print $ip, "\n"; 
}
