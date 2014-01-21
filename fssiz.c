#include <sys/types.h>
#include <sys/statvfs.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main()
{
    char hostname[1024];
    hostname[1023] = '\0';
    gethostname( hostname, 1023 ); 

    struct statvfs buf;
    if ( statvfs("/usr", &buf) == -1 ) {
        fprintf( stderr, "statvfs() error"); 
    }

    double size_gbytes = ( (double)buf.f_blocks * buf.f_bsize ) / 1024 / 1024 / 1024;
    printf("%s /usr: %.0f GB\n", hostname, size_gbytes ); 
    return 0;
}


