//
//  junko.c
//  CPlayground
//
//  Created by Mike Laursen on 11/28/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "junko.h"

void junko_func() {
    size_t junkSize = sizeof(char);
    (void) malloc(sizeof(char));
    
    int switchOnThisBaby = 101;
    
    switch (switchOnThisBaby) {
        case 100:
            printf("%d\n", 100);
            break;
        default:
            printf("%zu\n", junkSize);
    }
}


