#include <iostream>
#include <time.h>

using namespace std;

int main() {

    struct tm newtime;
    time_t ltime;
    char buf[50];

    ltime = time(&ltime);
    localtime_r(&ltime, &newtime); 

    cout << "The date and time is: " << asctime_r(&newtime, buf); 
}
