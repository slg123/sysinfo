#!/usr/local//bin/perl

use strict;
use warnings;
use Carp;
use Net::SSH::Expect; 

my $host = "om.houqe.lab";

my $ssh = Net::SSH::Expect->new (
    host     => $host,
    password => 'youwish',
    user     => 'test_user',
    raw_pty  => 1,
);

my $login_output = $ssh->login();

$ssh->exec( "stty raw -echo" ); 
my $cpuinfo = $ssh->exec( "cat /proc/cpuinfo" );
print $cpuinfo;

