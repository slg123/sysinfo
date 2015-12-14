#include <iostream>

int main() {
    int n = 60*60*24-1; // seconds in a day
    std::cout << n << std::endl; 

    int isize = sizeof(int)*8; 
    std::cout << "sizeof int: " << sizeof(int)*8 << " bits " << std::endl;

    int a = n&0x1f;
    int b = n&0x2f;
    int c = n&0x3f;
    int d = n&0x4f;
    int i = n&0x5f; 
    int j = n&0x6f; 
    int p = n&0x7f; 
    int q = n&0x8f; 

    int mask; 
    std::cout << " unmasked bits: " << a << " ...  mask bits:  " << a-isize << std::endl; 
    std::cout << " unmasked bits: " << b << " ...  mask bits:  " << b-isize << std::endl; 
    std::cout << " unmasked bits: " << c << " ...  mask bits:  " << c-isize << std::endl; 
    std::cout << " unmasked bits: " << d << " ...  mask bits:  " << d-isize << std::endl; 
    std::cout << " unmasked bits: " << i << " ...  mask bits:  " << i-isize << std::endl; 
    std::cout << " unmasked bits: " << j << " ...  mask bits:  " << j-isize << std::endl; 
    std::cout << " unmasked bits: " << p << " ...  mask bits:  " << p-isize << std::endl; 
    std::cout << " unmasked bits: " << q << " ...  mask bits:  " << q-isize << std::endl; 

    return 0;
}
