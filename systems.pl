#!/usr/local/bin/perl

use strict;
use warnings;
use autodie;
use List::MoreUtils qw(uniq); 
#use Net::SSH;

my @systems;
my @paths;

my $file = "/Unix3/Unix/agent/vsau73/build_tools/SYSTEMS";
open my $fh, "<", $file;
while ( <$fh> ) {
    next if /#/; 
    my @line = split ';', $_;
    push @systems, $line[0];
    push @paths,   $line[1];
}

for ( @systems ) {
    print $_, "\n";
}

my @all_paths; 
sub get_paths {
    for ( @paths ) {
        my @line = split ':', $_;
        if ( $line[0] ) {
            push @all_paths, $line[0]; 
        }
        if ( $line[0] && $line[1] ) {
            push @all_paths, $line[0]; 
            push @all_paths, $line[1]; 
        }
        if ( $line[0] && $line[1] && $line[2] ) {
            push @all_paths, $line[0]; 
            push @all_paths, $line[1]; 
            push @all_paths, $line[2]; 
        }
    }
}

get_paths(); 
my @unique_paths = uniq( @all_paths ); 
for ( @unique_paths ) {
    my $cmd = $_."/gcc -v";
    for my $hostname ( @systems ) {
        my ( $stdout, $stderr, $exit ) = system( 'ssh '.$hostname.' '.$cmd );
        if ( $stdout ) {
            print $stdout, "\n"; 
        }
        if ( $stderr ) {
            print $stderr, "\n"; 
        }
    }
}
