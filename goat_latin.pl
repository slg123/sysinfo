#!/usr/bin/perl

use strict;
use warnings;

my $string = 'I speak a bit of Goat Latin';

sub convert_to_goat_latin {
    my $str = shift;
    my @array = split / /, $str;
    my @new_array;

    my $counter = 0;
    for ( @array ) {
        if ( $_ =~ /^[aeiouy]/i ) {
            my $vowel_string = $_.add_some_as( $counter );
            push @new_array, $vowel_string;
        } else {
            my $first_char = substr( $_, 0, 1 ); 
            substr( $_, 0, 1, ""); 
            my $consonant_string = $_.$first_char.add_some_as( $counter ); 
            push @new_array, $consonant_string; 
        }
        $counter++;
    }
    my $gl_string = join( " ", @new_array ); 
    return $gl_string;
}

sub add_some_as {
    my $quantity = shift;
    return "a" x $quantity;
}

my $newstring = convert_to_goat_latin( $string ); 
print $newstring, "\n"; 



