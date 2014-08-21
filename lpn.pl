#!/usr/bin/perl 

use strict;
use warnings;

sub palindrome_check {
    my $in = shift;
    my @n = split //, $in;
    if (( $n[0] == $n[5] && $n[1] == $n[4] && $n[2] == $n[3] )) {
        return 1;
    }
}

sub get_numlength {
    my $in = shift;
    my @n = split //, $in;
    my $len = @n;
    return $len;
}

my @products = ();
for ( my $i = 1; $i <= 999; $i++ ) {
    for ( my $j = 1; $j <= 999; $j++ ) {
        my $prod = $i * $j; 
        if ( get_numlength( $prod ) > 5 ) {
            push @products, $i * $j;
        }
    }
}

my $highest = 100001; 
my @palindromes = (); 
foreach my $num ( @products ) {
    if ( palindrome_check( $num ) ) {
        if ( $num > $highest ) {
            $highest = $num;
        }
    }
}
print $highest, "\n"; 
