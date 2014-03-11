#include <stdio.h>
#include <stdlib.h>

#define DATA_SIZE  500
#define NUM_PEOPLE  25
#define NUM_SAMPLES 20

float random_samples[DATA_SIZE] = {};

void create_random_samples(); 
//void show_values();
float calculate_average( float *arr, int size );
float random_n_to_m( float i, float j ); 

int main() 
{
    float sample_average[NUM_SAMPLES] = {};

    int i, j;
    for ( i = 0; i < NUM_PEOPLE; i++ ) {
        for ( j = 0; j < NUM_SAMPLES; j++ ) {
            create_random_samples();
            sample_average[j] = calculate_average( random_samples, DATA_SIZE ); 
        }
    }

    for ( i = 0; i < NUM_PEOPLE; i++ ) {
        for ( j = 0; j < NUM_SAMPLES; j++ ) {
            printf( " person: %d sample: %d sample average: %.2f \n", i, j, sample_average[j] );
        }
    }
    return 0;
}

void create_random_samples( int num ) 
{
    int i;
    for ( i = 0; i < DATA_SIZE; i++ ) {
        random_samples[i] = random_n_to_m( 2.00, 5.00 );  // random samples between 2.00 and 5.00
    }
}

//void show_values()
//{
//    int i;
//    for ( i = 0; i < DATA_SIZE; i++ ) {
//        printf( "%.2f\n", random_samples[i] );
//    }
//}

float calculate_average( float *arr, int size ) 
{
    float average = 0;
    float total = 0;
    int i;
    for ( i = 0; i < size; i++ ) {
        total += arr[i];
    }
    average = total / size;
    return average;
}

float random_n_to_m( float i, float j ) 
{
    return i + ( rand() / ( RAND_MAX / ( j - i )));
}

