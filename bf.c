#include <stdio.h>

int main() {
    int i = get_smallest_multiple( 10, 1000000 );
    printf( "%d\n", i ); 
    int j = get_smallest_multiple( 20, 1000000000 ); 
    printf( "%d\n", j ); 
    return 0;
}

int divide( int n, int m ) {
    int i;
    int count = 0;
    for ( i = 1; i <= m; i++ ) {
        if ( n % i  == 0 ) {
            count++; 
        }
    }
    if ( count == m ) {
        return 1;
    } else {
        return 0;
    }
}

int get_smallest_multiple( int n, int m ) {
    int i;
    int result;
    int smallest = n;
    for ( i = m; i > 0; i-- ) {
        if ( divide( i, n ) == 1 ) {
            smallest = i;
        }
    }
    return smallest;
}

