#include <sys/types.h>
#include <sys/statvfs.h>
#include <stdio.h>
#include <stdlib.h>

#define NUM_FS 4

int main() {
    char hostname[1024];
    hostname[1023] = '\0';
    gethostname( hostname, 1023 ); 

    const char *filesystem[NUM_FS] = { "/usr", "/var", "/etc", "/tmp" }; 
    int i;
    for ( i = 0; i < NUM_FS; i++ ) {
        struct statvfs buf;
        if ( statvfs( filesystem[i], &buf ) == -1 ) {
            fprintf( stderr, "statvfs error" ); 
        }
        double size_gbytes = ((double)buf.f_blocks * buf.f_bsize ) / 1024 / 1024 / 1024;
        printf( "%s %s size: %0.2f GB\n", hostname, filesystem[i], size_gbytes ); 
    }
}

