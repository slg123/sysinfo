#!/usr/bin/perl

use strict;
use warnings;
use autodie;

chomp( my $os = `uname` );
chomp( our $date = `date '+%Y-%m-%d %H:%M:%S'` );
our $out = "/root/perl/linux_counters.csv";

sub get_linux_vmm_counters {

    my $file = "/proc/meminfo";
    my %counter_values = ();

    open my $fh, "<", $file;
    while ( <$fh> ) {
        chomp;
        my ( $name, $value, $junk ) = split ' ';
        $counter_values{ $name } = $value;
    }
    close $fh;

    open my $ofh, ">>", $out;
    my @wanted_values = qw( MemTotal: MemFree: Buffers: SwapFree: Shmem: Slab: );
    while ( my ( $name, $value ) = each %counter_values ) {
        for ( @wanted_values ) {
            if ( $name =~ $_ ) {
                print $ofh "$os,$date,$name,$value\n";
                printf "%s,%s,%s,%s\n", $os,$date, $name, $value;
            }
        }
    }
    close $ofh;

}

sub get_linux_cpu_counters {

    my $file = "/proc/stat";
    open my $fh, "<", $file;
    open my $ofh, ">>", $out;
    while ( <$fh> ) {
        if ( /cpu/ ) {
            my ( $cpu, $f1, $f2, $f3, $f4, $f5, $f6, $f7, $f8, $f9 ) = split ' ', $_;
            print "$os,$date,$cpu,$f1,$f2,$f3\n"; # example for now
            print $ofh "$os,$date,$cpu,$f1,$f2,$f3\n";
        }
    }
    close $fh;
    close $ofh;

}

sub get_aix_vmm_counters {

    my $cmd = "/usr/bin/svmon -G";
    open my $fh, "-|", $cmd;
    while ( <$fh> ) {
        if ( /pg space/ ) {
            my ( $junk1, $junk2, $page_size, $paging_inuse ) = split ' ', $_;
            print "$os,$date,$page_size,$paging_inuse,";
        }
        if ( /memory/ ) {
            my ( $junk, $memory_size, $memory_inuse ) = split ' ', $_;
            print "$memory_size,$memory_inuse\n"; 
        }
    }
    close $fh;

}

sub get_aix_cpu_counters {
    my $cmd = "/usr/bin/mpstat";
    open my $fh, "-|", $cmd;
    while ( <$fh> ) {
        print;
    }
    close $fh;
}

sub get_solaris_cpu_counters {
}

sub get_solaris_vmm_counters {
}

sub main {
    for ( my $i = 0; $i < 100; $i++ ) {
        if ( $os =~ "Linux" ) {
            get_linux_vmm_counters();
            get_linux_cpu_counters();
        }
        if ( $os =~ "AIX" ) {
            get_aix_vmm_counters();
            #get_aix_cpu_counters();
        }
        if ( $os =~ "Solaris" ) {
            get_solaris_cpu_counters();
            get_solaris_vmm_counters();
        }
        sleep( 10 );
    }
}

main();
