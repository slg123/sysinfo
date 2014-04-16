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
    print "System exceeded threshold of $threshhold errpt report identifiers...\n";
    print "There are currently $errpt_linecount alerts in your error log.\n";
    print "There following are the unique alerts in your errpt error log.\n"; 
    print "You will want to run errpt -a -j IDENTIFIER where IDENTIFIER is \n"; 
    print "the alphanumeric identifier for the errpt message.\n"; 
}

while ( my ( $identifier, $description ) = each %uniq_errpt_messages ) {
    print "$identifier, $description\n";
}
