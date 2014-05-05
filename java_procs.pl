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

our ( $total_szero, $total_sone, $total_sou, $total_ec, $total_eu, $total_oc, $total_ou, 
      $total_pc, $total_pu, $total_ygc, $total_ygct, $total_fgc, $total_fgct, $total_gct ) = 0; 

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
                $total_szero += $szero;
                $total_sone  += $sone; 
                $total_sou   += $sou; 
                $total_ec    += $ec; 
                $total_eu    += $eu; 
                $total_oc    += $oc; 
                $total_ou    += $ou; 
                $total_pc    += $pc; 
                $total_pu    += $pu; 
                $total_ygc   += $ygc; 
                $total_ygct  += $ygct; 
                $total_fgc   += $fgc; 
                $total_fgct  += $fgct; 
                $total_gct   += $gct;
            }
        }
    }
}

sub main {
    get_pids(); 
    get_jstats( @pids );
    printf "%.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f\n", 
            $total_szero, $total_sone, $total_sou, $total_ec, $total_eu, $total_oc, $total_ou, 
            $total_pc, $total_pu, $total_ygc, $total_ygct, $total_fgc, $total_fgct, $total_gct; 
}

main(); 
