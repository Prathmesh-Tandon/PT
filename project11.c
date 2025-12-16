#include<stdio.h>
void main(){
    short int arr_sht[5]={1,2,3,4,5};
    int arr_int[5]={6,7,8,9,0};
    printf("size of arr_sht: %ld\n", sizeof(arr_sht));
    printf("size of arr_int: %ld\n", sizeof(arr_int));
    
    //out of bound access
    int x[2]={1,2};
    int arr[2]={100,101};
    int y[2]={5,6};
    arr[2]=500;
    printf("%d\n",y[0]);

    //character pointer - string and character array
    char *ptr="prathmesh";
    char a[]={'p','r','a','t','h','a','m','\0'};
    char b[]="pratham";
    printf("%s\n",ptr);
    printf("%s\n",a);
    printf("%s\n",b);
    printf("size of a: %ld\n",sizeof(a));
    return;

    //
}