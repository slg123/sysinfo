#!/usr/bin/perl

use strict;
use warnings;
use autodie;

our @pids;
sub get_pids {
    my $cmd = "pgrep java";
    open my $ps_fh, "-|", $cmd;
    while ( <$ps_fh> ) {
        push @pids, $_;
    }
    return @pids;
}

sub get_jstats {
    my @java_pids = @_;
    foreach my $pid ( @java_pids ) {
        chomp $pid;
        my $java_garbage_collection_cmd = "/usr/bin/jstat -gc $pid"; 
        open my $gc_fh, "-|", $java_garbage_collection_cmd;
        while ( <$gc_fh> ) {
            my ( $szero, $sone, $sou, $ec, $eu, $oc, $ou, $pc, $pu, $ygc, $ygct, $fgc, $fgct, $gct ) = split /\s+/;
            if ( /\d+.\d/ ) {
                print "$pid: $szero $sone $sou $ec $eu $oc $ou $pc $pu $ygc $ygct $fgc $fgct $gct\n";
            }
        }
    }
}

sub main {
    get_pids(); 
    get_jstats( @pids );
}

main(); 
