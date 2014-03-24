#!/usr/bin/perl

use strict;
use warnings;

use Fcntl qw(:seek);

my $running = 1;
while ( $running ) {
    system( '/usr/bin/clear' );  
    get_file_positions();
    sleep 10;
}

sub get_file_positions {
    my @files = glob( "/var/log/messages*" );
    for ( @files ) {
        my $file = $_;
        open my $fh, "<", $file or die "can't open: $!\n";
        seek( $fh, 0, SEEK_END );
        my $current_position = tell( $fh ); 
        printf "%30s %20d\n", $file, $current_position;
    }
}

