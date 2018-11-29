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

#define GRID_DIM 12

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    junko_func();
    
    char grid[GRID_DIM][GRID_DIM];
    makePattern(&grid[0][0], GRID_DIM);
    
    for (int i = 0; i < GRID_DIM; i++) {
        for (int j = 0; j < GRID_DIM; j++) {
            printf("%c", grid[i][j]);
        }
        printf("\n");
    }
    
    return 0;
}
