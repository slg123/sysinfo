#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define _POSIX_C_SOURCE 200809L

void sigint( int signo ) {
    ( void )signo;
}

void *thread( void *argument ) {
    ( void )argument;

    typedef struct range range;
    
    struct range { 
        int start;
        int end;
    };

    range r1 = {     0, 5000  }; 
    range r2 = {  5001, 10000 }; 
    range r3 = { 10001, 15000 }; 


    for ( ;; ) {
        printf( "Thread %u running.\n", *( unsigned int* )argument);
        find_highly_divisible( r1.start, r1.end ); 
        sleep( 1 );

    }
    for ( ;; ) {
        printf( "Thread %u running.\n", *( unsigned int* )argument);
        find_highly_divisible( r2.start, r2.end ); 
        sleep( 1 );
    }
    for ( ;; ) {
        printf( "Thread %u running.\n", *( unsigned int* )argument);
        find_highly_divisible( r3.start, r3.end ); 
        sleep( 1 );
    }

    return NULL;

}

int find_highly_divisible( int start, int end ) {
    int i, j, k;
    for ( i = start; i < end; i++ ) {
        j = generate_triangle_number( i );
        k = get_factor_count( j );

        //printf( "%d : %d : %d\n", i, j, k ); LOL don't print this out in your threaded program. 
        if ( k > 500 ) {
            printf( "FOUND!! -> %d is divisible by more than 500 numbers.\n", j );
            break;
        }
    }
    return 0;
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


int main( void ) {
    sigset_t sigset, oldset;
    sigemptyset( &sigset );
    sigaddset( &sigset, SIGINT ); 
    pthread_sigmask( SIG_BLOCK, &sigset, &oldset ); 

    pthread_t thread1, thread2, thread3;
    pthread_create( &thread1, NULL, thread, &( unsigned int ){1} ); 
    pthread_create( &thread1, NULL, thread, &( unsigned int ){2} ); 
    pthread_create( &thread1, NULL, thread, &( unsigned int ){3} ); 

    struct sigaction s;
    s.sa_handler = sigint;
    sigemptyset( &s.sa_mask ); 
    s.sa_flags = 0;
    sigaction( SIGINT, &s, NULL ); 

    pthread_sigmask( SIG_SETMASK, &oldset, NULL ); 

    pause(); 

    pthread_cancel( thread1 ); 
    pthread_cancel( thread2 ); 
    pthread_cancel( thread3 ); 

    pthread_join( thread1, NULL ); 
    pthread_join( thread2, NULL ); 
    pthread_join( thread3, NULL ); 

    puts( "Terminated." ); 
    return EXIT_SUCCESS;
}



