#include <stdio.h>

int main() {
    printf( "%d\n", get_smallest_multiple( 10, 1000000 ) ); 
    printf( "%d\n", get_smallest_multiple( 20, 1000000000 ) ); 
    return 0;
}

int is_divisible( int n, int m ) {
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
        if ( is_divisible( i, n ) ) {
            smallest = i;
        }
    }
    return smallest;
}

