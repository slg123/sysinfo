#!/usr/bin/perl

use strict;
use warnings;
use autodie;

our @pids;
sub get_pids {
    my $cmd = "ps -ef | grep java | awk '{ print \$2 }'"; 
    open my $ps_fh, "-|", $cmd;
    while ( <$ps_fh> ) {
        push @pids, $_;
    }
    return @pids;
}

sub get_jstats {
    for my $pid ( @pids ) {
        my $java_garbage_collection_cmd = "/usr/bin/jstat -gc $pid"; 
        open my $gc_fh, "-|", $java_garbage_collection_cmd;
        while ( <$gc_fh> ) {
            if ( /\d+/ ) {
                my ( $szero, $sone, $sou, $ec, $eu, $oc, $ou, $pc, $pu, $ygc, $ygct, $fgc, $fgct, $gct ) = split /\s+/;
                print "$szero $sone $pc $pu $gct\n"; 
            }
        }
    }
}

sub main {
    get_pids(); 
    get_jstats();
}

main(); 
