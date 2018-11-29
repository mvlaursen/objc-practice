//
//  pattern.c
//  CPlayground
//
//  Created by Mike Laursen on 11/29/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#include "pattern.h"

void printPattern(int size) {
    int startRowWithX = 0;
    
    for (int i = 0; i < size; i++) {
        int alternateX = startRowWithX;
        
        for (int j = 0; j < size; j++) {
            if ((alternateX = !alternateX)) {
                printf("x");
            } else {
                printf(".");
            }
        }
        printf("\n");
        startRowWithX = !startRowWithX;
    }
}
