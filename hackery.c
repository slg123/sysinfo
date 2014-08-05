#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print_string( char *str, int sz ); 

int main() {
    char *str = "this is a string"; 
    char *rev = malloc( strlen(str+1 )); 

    int i, j;

    print_string( str, strlen(str+1) ); 

    int sz = strlen(str)+1;
    for ( i = sz-1, j = 0; i >= 0 && j < sz; i--, j++ ) {
        rev[j] = str[i];
    }

    printf( "\n" ); 

    int n;
    for ( n = 0; n < sz; n++ ) {
        printf( "%c", rev[n] ); 
    }


    printf( "\n" ); 
    return 0;
}

void print_string( char *str, int sz ) {
    int i;
    for ( i = 0; i < sz+1; i++ ) {
        if ( str[i] == ' ' ) {
            printf( " " );
        } else {
            printf( "%c", str[i] );
        }
    }
}

