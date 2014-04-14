#!/usr/bin/perl

use strict;
use warnings;
use autodie;

sub get_linux_vmm_counters {
    # linux virtual memory (vmm) stats
    my @wanted_vmm_counters = qw( MemFree: Buffers: Cached: SwapTotal: Swap: Mem: MemShared: ); 
    my $linux_vmm_file      = "/proc/meminfo";
    my %linux_vmm_counters  = (); 

    open my $fh, "<", $linux_vmm_file;
    while ( <$fh> ) {
        my ( $counter, $value, $junk ) = split ' ';
        $linux_vmm_counters{ $counter } = $value;
    }
    close $fh;

    while ( my ( $counter, $value ) = each %linux_vmm_counters ) {
        for ( @wanted_vmm_counters ) {
            if ( $counter =~ $_ ) {
                print "$counter,$value\n";
            }
        }
    }
}
get_linux_vmm_counters();
