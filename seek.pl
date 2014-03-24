#!/usr/bin/perl

use strict;
use warnings;

use Fcntl qw(:seek);

our $prev_position = 0;
our $difference = 0;

my $running = 1;
while ( $running ) {
    get_file_positions();
    sleep 10;
    system( '/usr/bin/clear' );  
}

sub get_file_positions {
    my $count = 0;
    my @files = glob( "/var/log/messages*" );
    for ( @files ) {
        my $file = $_;
        open my $fh, "<", $file or die "can't open: $!\n";
        seek( $fh, 0, SEEK_END );
        my $current_position = tell( $fh );
        $prev_position = $current_position;
        if ( $count > 0 ) {
            $difference = $prev_position - $current_position;
        }
        printf "%30s %20d position change: %20d\n", $file, $current_position, $difference;
        $count++; 
    }
}

