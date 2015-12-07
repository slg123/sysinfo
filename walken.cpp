#include <iostream>

int main(void) {

    const char *Days[7] = {"SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"};
    int i;
    for (i = 0; i < 7; i++) {
        std::cout << Days[i] << std::endl;
    }

    std::cout << "Testing Days[0]" << std::endl; 
    std::cout << Days[0] << std::endl;
    std::cout << "Testing Days[7]" << std::endl; 
    std::cout << Days[7] << std::endl;
    return 0;

}
