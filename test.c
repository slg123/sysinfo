#include <stdio.h>
#include <sys/statvfs.h>

long long getFreeDiskSpace();
unsigned long long ull_getFreeDiskSpace();

int main() {

    long long i = -1;
    printf("%lld\n", i ); 
    printf("%d\n", sizeof( int )); 
    printf("%d\n", sizeof( long )); 
    printf("%d\n", sizeof( long long ));
    printf("%d\n", sizeof( unsigned long long ));
    printf("%d\n", sizeof( double ));

    long long foo = getFreeDiskSpace();
    printf( "xxx %lld\n", foo ); 
    unsigned long long bar = ull_getFreeDiskSpace();
    printf( "xxx %llu\n", bar ); 

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
