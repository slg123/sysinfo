#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUM_THREADS 3

void *find_triangle_factors(void *threadid)
{

   long tid1;
   tid1 = (long)threadid;
   printf("In thread #%ld!\n", tid1);

   int i, j, k;
   for ( i = 0; i < 5000; i++ ) {
       j = generate_triangle_number( i );
       k = get_factor_count( j ); 
       if ( k > 500 ) {
           printf( "FOUND!! %d is divisible by more than 500 numbers.\n", j ); 
           exit(1); 
       }
   }

   long tid2;
   tid2 = (long)threadid;
   printf("In thread #%ld!\n", tid2);

   int a, b, c;
   for ( a = 5000; a < 10000; a++ ) {
       b = generate_triangle_number( a ); 
       c = get_factor_count( b ); 
       if ( k > 500 ) {
           printf( "FOUND!! %d is divisible by more than 500 numbers.\n", b ); 
           exit(1); 
       }
   }

   long tid3;
   tid3 = (long)threadid;
   printf("In thread #%ld!\n", tid3);

   int d, e, f;
   for ( d = 10000; d < 15000; d++ ) {
       e = generate_triangle_number( d ); 
       f = get_factor_count( e ); 
       if ( k > 500 ) {
           printf( "FOUND!! %d is divisible by more than 500 numbers.\n", e ); 
           exit(1); 
       }
   }

   pthread_exit(NULL);
}

int generate_triangle_number( int i ) {
    int j;
    int n = 0;
    for ( j = i; j > 0; j-- ) {
        n += j;
    }
    return n;
}

int get_factor_count( int n ) {
    int i;
    int count = 0;
    for ( i = 1; i <= n; i++ ) {
        if ( n % i == 0 ) {
            count++;
        }
    }
    return count;
}


int main (int argc, char *argv[])
{
   pthread_t threads[NUM_THREADS];
   int rc;
   long t;
   for(t=0; t<NUM_THREADS; t++){
      printf("In main: creating thread %ld\n", t);
      rc = pthread_create(&threads[t], NULL, find_triangle_factors, (void *)t);
      if (rc){
         printf("ERROR; return code from pthread_create() is %d\n", rc);
         exit(-1);
      }
   }

   /* Last thing that main() should do */
   pthread_exit(NULL);
}
