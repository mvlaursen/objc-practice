//
//  main.c
//  CPlayground
//
//  Created by Mike Laursen on 11/28/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#include <stdio.h>
#include "junko.h"
#include "pattern.h"

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    junko_func();
    
    printPattern(12);
    
    return 0;
}
