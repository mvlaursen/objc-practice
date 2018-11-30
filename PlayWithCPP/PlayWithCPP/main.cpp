//
//  main.cpp
//  PlayWithCPP
//
//  Created by Mike Laursen on 11/29/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#include <iostream>
#include "ListNode.hpp"

const size_t N_ITEMS = 10;

int main(int argc, const char * argv[]) {
    int arrayInt[N_ITEMS] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    ListNode<int> *pHeadInts = ListNode<int>::fromArray(arrayInt, N_ITEMS);
    std::cout << pHeadInts;
    ListNode<int>::deleteList(pHeadInts);
    
    char arrayChars[N_ITEMS] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'};
    ListNode<char> *pHeadChar = ListNode<char>::fromArray(arrayChars, N_ITEMS);
    std::cout << pHeadChar;
    ListNode<char>::deleteList(pHeadChar);

    return 0;
}
