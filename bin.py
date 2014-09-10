#!/usr/bin/python

def binary( n ):
    if n == 0 or n == 1:
        return n
    k = n / 2
    b = n % 2
    E = binary( k )

    return str(E)+str(b)

for i in range( 256 ):
    print binary( i )


