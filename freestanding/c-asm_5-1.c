//using pointer const variable can be modified
int piyush(){
    const int xyz = 5;
    int *pxyz = &xyz;
    *pxyz = 9;
    //volatile example
    volatile int i = 6;
    i = i+1;
    i= i+2;

    return i;
}