//
//  main.cpp
//  PlayWithCPP
//
//  Created by Mike Laursen on 11/29/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#include <iostream>
#include "LinkedList.hpp"

const size_t N_ITEMS = 10;

int main(int argc, const char * argv[]) {
    int arrayInt[N_ITEMS] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    LinkedList<int> listInt(arrayInt, N_ITEMS);
    std::cout << listInt;
    
    char arrayChar[N_ITEMS] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'};
    LinkedList<char> listChar(arrayChar, N_ITEMS);
    std::cout << listChar;

    return 0;
}
