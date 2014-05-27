#!/usr/bin/perl

use strict;
use warnings;
use IO::Socket;

my $HttpPort = 8888;
our $port;
our $url = "/index.html";
our $address = 'om.houqe.lab';
$port = $HttpPort;
print "DEBUG: $port\n";

my $connection;

if ( $port ) {
    print "connecting to $address:$port\n"; 
    $connection = IO::Socket::INET->new(Proto => "tcp", 
        PeerAddr => "$address:$port",
        Timeout  => 15 
    );
} else {
    $connection = IO::Socket::INET->new(
        Proto    => "tcp",
        PeerAddr => "http($port)",
        Timeout  => 15
    );
}

$connection->autoflush(1);
print "DEBUG: $connection ->" . "HEAD $url HTTP/1.0" . "\015\012" . "\015\012";
print "DEBUG: $connection\n"; 
exit(42); 
#my $line = <$connection>;

