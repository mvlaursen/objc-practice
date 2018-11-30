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
    int array[N_ITEMS] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    ListNode *pHead = ListNode::fromArray(array, N_ITEMS);
    std::cout << pHead;
    return 0;
}
