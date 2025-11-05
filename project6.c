#include <stdio.h>
typedef char int8_t;
struct pixel_t{
        unsigned char r;
        unsigned char g;
        unsigned char b;
    };
void main(){
    int8_t g = 8;
    int size = sizeof(g);
    printf("%ld\n", sizeof(size));
    struct pixel_t p;
    printf("%ld\n", sizeof(p));


}