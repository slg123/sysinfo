#!/usr/bin/perl

# Get java process garbage collection statistics.

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
                #
                # Please see the manual page or Oracle documentation to get a comprehensive
                # overview of what these variables mean.
                #
                $total_szero += $szero;      # S0C  - Current survivor space 0 capacity (KB).
                $total_sone  += $sone;       # S1C  - Current survivor space 1 capacity (KB).
                $total_sou   += $sou;        # S0U  - Survivor space 0 utilization (KB).
                $total_ec    += $ec;         # EC   - Current eden space capacity (KB). 
                $total_eu    += $eu;         # EU   - Eden space utilization (KB).
                $total_oc    += $oc;         # OC   - Current old space capacity (KB).
                $total_ou    += $ou;         # OU   - Old space utilization (KB). 
                $total_pc    += $pc;         # PC   - Current permanent space capacity (KB). 
                $total_pu    += $pu;         # PU   - Permanent space utilization (KB). 
                $total_ygc   += $ygc;        # YGC  - Number of young generation GC events. 
                $total_ygct  += $ygct;       # YGCT - Young generation garbage collection time.
                $total_fgc   += $fgc;        # FGC  - Number of full GC events.
                $total_fgct  += $fgct;       # FGCT - Full garbage collection time.
                $total_gct   += $gct;        # GCT  - Total garbage collection time. 
            }
        }
    }
}

sub main {
    get_pids(); 
    get_jstats( @pids );
    printf "all processes: %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f %.1f\n", 
            $total_szero, $total_sone, $total_sou, $total_ec, $total_eu, $total_oc, $total_ou, 
            $total_pc, $total_pu, $total_ygc, $total_ygct, $total_fgc, $total_fgct, $total_gct; 
}

main(); 
