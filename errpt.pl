#!/usr/bin/perl

use strict;
use warnings;
use autodie;

my $threshhold          = 30;  # 30 for now. Higher or lower depending on the system.
my $errpt_linecount     = 0;
my %uniq_errpt_messages = (); 

my $cmd = "/usr/bin/errpt";

open my $fh, "-|", $cmd;
while ( <$fh> ) {
    $errpt_linecount++;
    my ( $identifier, $timestamp, $t, $c, $resource_name, @description ) = split ' ';
    my $description_message = join( " ", @description );
    $uniq_errpt_messages{ "$identifier" } = $description_message;
}
close $fh;

#
# do something with this later - fire an alert email or whatever. 
#
if ( $errpt_linecount > $threshhold ) {
    print "system exceeded threshold of $threshhold errpt report identifiers...\n";
}

while ( my ( $identifier, $description ) = each %uniq_errpt_messages ) {
    print "$identifier, $description\n";
}
