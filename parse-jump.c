#include <stdlib.h>
#include <stdio.h>

int main(int argc, char* argv[]){
    if (argc <= 2) exit(1);
    char* p = argv[2];
    char rows = 0;
    char c = 0;
    char state = (**(argv+1) == '1');
    do {
	if (*p >= 'a' && *p <= 'z'){
            rows += 25*c + (!c++)*(*p - 'a') + 1;
	} else if (state == 1) {
            printf("%d", atoi(p));
            exit(0);
	}
    } while (*++p);
    if (state != 1) 
        printf("%d", rows);
    else          
        printf("%d", -1);
}
