#!/usr/bin/env python

def convert_to_goat_latin( str ):
    out = []
    words = str.split()
    counter = 0
    for word in words:
        if word[0] == "aeiouy":
            out.append( ( word[1:] ) + ( "a" * counter ) )
        else:
            first_char = word[0:1]
            out.append(( word[1:] ) + first_char + ( "a" * counter ) )
        counter += 1
    return out

string = 'I speak a bit of Goat Latin'
print ' '.join( convert_to_goat_latin( string ) )
