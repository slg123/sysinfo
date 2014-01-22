#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pwd.h>

const char *get_acct_info( const char *buf );

int main() { 

    const char *buf1;
    const char *buf2;

    buf1 = "root";
    buf2 = "daemon"; 

    printf("  root name: %s\n", get_acct_info( buf1 )); 
    printf("daemon name: %s\n", get_acct_info( buf2 )); 

    return 0;

}

const char *get_acct_info( const char *buf ) {
    struct passwd *pp;
    pp = getpwnam( buf ); 
    return pp->pw_name;
}
