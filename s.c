#include <stdio.h>
#define N 2000000
int main() {
    int i, j, a[N]; 
    long long sum; 
    for ( i = 2; i < N; i++ ) a[i] = 1;
    for ( i = 2; i < N; i++ ) {
        if ( a[i] ) {
            for ( j = i; j < N/i; j++ ) {
                a[i*j] = 0;
            }
        }
    }

    for ( i = 2; i < N; i++ ) {
        if ( a[i] ) {
            sum += i; 
        }
    }
    printf( "%lld\n", sum ); 
    return 0;
}
