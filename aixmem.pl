#!/usr/bin/perl

sub get_aix_mem_percent_used {
    my ( $percent_used, $in_use, $memory ) = 0;
    my $cmd = "svmon -G";
    open my $fh, "-|", $cmd;
    while ( <$fh> ) {
        if ( /memory/ ) {
            my @line = split /\s{2,}/;
            $memory = $line[1];
        }
        if ( /in use/ ) {
            my @line = split /\s{2,}/;
            $in_use = $line[1];
        }
        if ( $memory != 0 ) {
            $percent_used = $in_use / $memory * 100;
        } else {
            $percent_used = "divide by zero error"; 
        }
    }
    return $percent_used;
}

my $pct_inuse = get_aix_mem_percent_used();
printf "%0.2f\n", $pct_inuse;
