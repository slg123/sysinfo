#include <stdio.h>

// given nine coins, one coin weighs less than the other eight.
// how many weighings are required to find the light coin?

#define NUMCOINS 9
#define PILESIZE 3

int total_weight( int arr[] );
int pile_weight( int i, int j ); 

int coins[NUMCOINS] = { 10, 10, 10, 9, 10, 10, 10, 10, 10 }; 

int pile1[PILESIZE] = {};
int pile2[PILESIZE] = {}; 
int pile3[PILESIZE] = {}; 

int main()
{
    printf( "%d\n", total_weight( coins )); 

    int pile1_weight = pile_weight( 0, 0 );
    int pile2_weight = pile_weight( 0, 3 );
    int pile3_weight = pile_weight( 0, 6 );

    int weights[3] = { pile1_weight, pile2_weight, pile3_weight };

    int i;
    int counter = 0;
    for ( i = 0; i <= 6; i += 3 ) {
        printf( "weight of pile: %d -> %d\n", counter, pile_weight( 0, i )); 
        counter++;
    }
    printf( "total num weighings to find the light coin: %d\n", counter ); 

    // get the stack of coins that has the smallest weight
    int smallest = 10000; 
    for ( i = 0; i < 3; i++ ) {
        if ( weights[i] < smallest ) {
            smallest = weights[i];
        }
    }
    printf( "weight of smallest pile: %d\n", smallest ); 
}

int pile_weight( int i, int j ) 
{
    int pile[PILESIZE] = {}; 
    int total = 0;

    while ( i < PILESIZE ) {
        pile[i] = coins[j];
        total += pile[i]; 
        i++;
        j++;
    }
    return total;
}

int total_weight( int arr[] ) 
{
    int total = 0;
    int i;
    for ( i = 0; i < NUMCOINS; i++ ) {
        total += arr[i];
    }
    return total;
}
