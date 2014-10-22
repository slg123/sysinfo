#include <stdio.h>
#include <string.h>

int main()
{
    char *flab[] = {
        "quite",
        "actually",
        "just",
        "really",
        "test",
        "whatever",
        "flab",
        "some",
        NULL
    };

    char *words[] = {
        "some",
        "actually",
        "may",
        "be",
        "in",
        "the",
        "flab",
        "array",
        NULL
    };

    // find the words that are in both the words and flab arrays
    int i, j;
    for ( i = 0; words[i] != NULL; i++ ) {
        j = find_word( words[i], flab );
    }

    return 0;
}

int find_word( char *word, char *array[] )
{
    int i;
    for ( i = 0; array[i] != NULL; i++ ) 
        if ( strcmp( word, array[i]) == 0 ) 
            printf( "word \"%s\" found.\n", word ); 
            return 1;

    return -1;
}


