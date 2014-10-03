#!/usr/bin/perl -w 
use strict;
use Math::BigInt;
use List::Util qw( reduce max min );

my $sum = reduce { $a + $b } 1 .. 1000;
print $sum, "\n";

my $product = new Math::BigInt '1'; 
$product = reduce { new Math::BigInt($a) * new Math::BigInt($b) } 1 .. 1000; 
print $product, "\n";

my @arr = ( 1, 30, 29, 9020, -4 );
my $min = min @arr;
my $max = max @arr;

print "$min $max\n";

my $total = new Math::BigInt '1'; 
for ( my $i = 1; $i <= 1000; $i++ ) {
    $total *= $i;
}
print $total, "\n"; 

print "\n\n$dd"; 

