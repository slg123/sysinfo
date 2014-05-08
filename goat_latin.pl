#!/usr/bin/perl

use strict;
use warnings;

my $string = 'I speak a bit of Goat Latin';
my @array = split / /, $string;
my @new_array = {}; 

my $counter = 0;
for ( @array ) {
    if ( $_ =~ /^[aeiouy]/i ) {
        my $goat_latin_vowel_string = $_.add_some_as( $counter );
        push @new_array, $goat_latin_vowel_string;
    } else {
        my $first_char = substr( $_, 0, 1 ); 
        substr( $_, 0, 1, ""); 
        my $goat_latin_consonant_string = $_.$first_char.add_some_as( $counter ); 
        push @new_array, $goat_latin_consonant_string;
    }
    $counter++;
}

sub add_some_as {
    my $quantity = shift;
    return "a" x $quantity;
}

my $goat_latin_string = join( " ", @new_array );
print $goat_latin_string, "\n"; 



