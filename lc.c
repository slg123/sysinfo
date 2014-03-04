#include <stdio.h>

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
    int j = 0;
    for ( i = 0; i <= 6; i += 3 ) {
        j++;
        printf( "pile %d weight: %d\n", j, pile_weight( 0, i )); 
    }

    // get the stack of coins that has the smallest weight
    int smallest = 10000; 
    int pile_counter = 0;
    int smallest_weight = 0;
    for ( i = 0; i < 3; i++ ) {
        pile_counter++;
        if ( weights[i] < smallest ) {
            smallest = weights[i];
            smallest_weight = pile_counter;
        }
    }
    printf( "smallest pile weight: pile # %d\n", smallest_weight ); 
    return 0;
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
