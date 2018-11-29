//
//  pattern.c
//  CPlayground
//
//  Created by Mike Laursen on 11/29/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#include "pattern.h"

void makePattern(char *grid, int dim) {
    size_t sizeOfChar = sizeof(char);
    int startRowWithX = 0;
    char *currChar = grid;

    for (int i = 0; i < dim; i++) {
        int alternateX = startRowWithX;

        for (int j = 0; j < dim; j++) {
            if ((alternateX = !alternateX)) {
                *currChar = 'X';
            } else {
                *currChar = '.';
            }
            currChar += sizeOfChar;
        }
        startRowWithX = !startRowWithX;
    }
}
