#!/usr/bin/perl 

# farting with perl data structures.

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

print "\n"x4;

my @loh = (
    {
        name    => 'Dr. Watson',
        street  => '221b Baker St.',
        city    => 'London',
        zone    => 'NW1',
        country => 'England',
    },

    {
        name    => 'Sam Gamgee',
        street  => 'Bagshot Row',
        city    => 'Hobbiton',
        country => 'The Shire',
    },
     
    {
        name    => 'Defender',
        street  => '2600 Atari Way',
        city    => 'Tokyo',
        country => 'Japan',
    },
);

my $sam_city = $loh[1]{city};
print $sam_city, "\n"; 

print "\n"x4;

package Address;

sub new {
    my $package = shift;
    my $self = { @_ };
    return bless $self, $package;
}

my $Watson_Address = Address->new(
        name    => 'Dr. Watson',
        street  => '221b Baker St.',
        city    => 'London',
        zone    => 'NW1',
        country => 'England',
);

sub as_string {
    my $self = shift;
    my $string;
    foreach ( qw( name street city zone country ) ) {
        $string .= "$self->{$_}\n" if defined $self->{$_};
    }
    return $string;
}

print $Watson_Address->as_string;


