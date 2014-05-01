#!/usr/bin/perl

use strict;
use warnings;
use autodie;

sub get_java_process_info {

    my $java_processes_cmd = "/bin/ps -C java v"; 
    open my $ps_fh, "-|", $java_processes_cmd;
    while ( <$ps_fh> ) {
        my ( $pid, $tty, $stat, $time, $majfl, $trs, $drs, $rss, $mem, @command ) = split /\s+/; 
        my $java_process = join( " ", @command ); 
        print "$mem $java_process\n"; 
    }
    close $ps_fh;

    my @pids = `ps -C java | awk '{ print \$1 }' | grep -v PID`; 

    foreach my $pid ( @pids ) {
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

get_java_process_info(); 
