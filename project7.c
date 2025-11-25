
void pratham(){
    int i = 10;
    int j = 2;

    if (i==11){
        j=j+200;
    }

    switch(i){
        case 1:
            j=j+10;
            break;
        case 2:
            j=j+100;
            break;
        default:
            j=j+1000;
    }
    return;
}
