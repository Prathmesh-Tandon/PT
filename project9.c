#include<stdio.h>

void foo();

void foo (){
    printf("Hello World nth time\n");
    int a = 10;
    printf("%ld\n", sizeof(a));
}
void main(){
foo();
return;
}