#!/usr/bin/perl 

# list of lists example - borrowed from Mastering Algorithms in Perl.

use strict;
use warnings;

# list of lists 
my @lol = (
    [ 'Dr. Watson',    undef,    '221b',
      'Baker St.',     undef,    'London',
      'NW1',           undef,    'England',
      undef
    ],

    [ 'Sam Gamgee',    undef,    undef,
      'Bagshot Row',   undef,    'Hobbiton',
      undef,           undef,    'The Shire',
      undef
    ],

    [ 'Defender',      undef,    undef,
      'Atari',         undef,    '2600',
      undef,           undef,    'Entertainment Console',
    ],
);

my $sam_city = $lol[1][5];
print $sam_city, "\n"; 

my $atari_game = $lol[2][0];
print $atari_game, "\n"; 

# print the Atari stuff
foreach my $i ( @{ $lol[2] } ) {
    print $i, "\n", if defined $i; 
}

# print the whole thing 
for ( my $i = 0; $i < 3; $i++ ) {
    foreach my $j ( @{ $lol[$i] } ) {
        print $j, "\n", if defined $j;
    }
}
