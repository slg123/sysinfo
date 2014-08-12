#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    FILE *fp;
    char *line = NULL;
    char *filename = "/Unix3/Unix/agent/vsau73/build_tools/SYSTEMS"; 
    size_t len = 0;
    ssize_t read;
    const char *comment = "#"; 

    fp = fopen( filename, "r" );
    if ( fp == NULL ) {
        printf( "file %s does not exist.\n", filename ); 
        exit( EXIT_FAILURE );
    }

    while (( read = getline( &line, &len, fp )) != -1 ) {
        if ( strncmp( comment, line, 1 ) != 0 ) { 
            char *system = strtok( line, ";" ); 
            printf( "%s\n", system ); 
        }
    }

    if ( line ) {
        free( line );
    }
    exit( EXIT_SUCCESS );
}

