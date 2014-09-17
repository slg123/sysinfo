#include <stdio.h>
#include <sys/statvfs.h>

long long getFreeDiskSpace();
unsigned long long ull_getFreeDiskSpace();

int main() {

    long long i = -1;
    unsigned long long j = -1;

    printf("%lld\n", i ); 
    printf("%llu\n", j ); 

    printf("%d\n", sizeof( int )); 
    printf("%d\n", sizeof( long )); 
    printf("%d\n", sizeof( long long ));
    printf("%d\n", sizeof( unsigned long long ));
    printf("%d\n", sizeof( double ));

    printf( "xxx %lld\n", getFreeDiskSpace() ); 
    printf( "xxx %llu\n", ull_getFreeDiskSpace()); 

    return 0;
}

long long getFreeDiskSpace() {
    struct statvfs statvfs_buf;
    if ( statvfs( "/", &statvfs_buf ) == -1 ) {
        return -1;
    } 
    // return megabytes free
    return statvfs_buf.f_bfree * statvfs_buf.f_frsize / 1024 / 1024;
}

unsigned long long ull_getFreeDiskSpace() {
    struct statvfs statvfs_buf;
    //if ( statvfs( "/", &statvfs_buf ) == -1 ) {
    if ( statvfs( "/foofanu", &statvfs_buf ) == -1 ) {
        return -1;
    } 
    // return megabytes free
    return statvfs_buf.f_bfree * statvfs_buf.f_frsize / 1024 / 1024;
}
