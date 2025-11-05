#include <stdio.h>
typedef char int8_t;
void main(){
    int8_t g = 8;
    int size = sizeof(g);
    printf("%d\n", size);
}