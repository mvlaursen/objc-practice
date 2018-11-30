//
//  ListNode.cpp
//  PlayWithCPP
//
//  Created by Mike Laursen on 11/30/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#include <iostream>
#include "ListNode.hpp"

ListNode::ListNode()
: mnValue(0), mpNext(nullptr) {
}

ListNode::ListNode(int nValue, ListNode *pNext)
: mnValue(nValue), mpNext(pNext) {
}

ListNode::ListNode(const ListNode& other)
: mnValue(other.mnValue), mpNext(other.mpNext) {
}

ListNode::~ListNode() {
}

ListNode& ListNode::operator=(const ListNode& other) {
    if (this != &other) {
        mnValue = other.mnValue;
        mpNext = other.mpNext;
    }
    
    return *this;
}

ListNode *ListNode::fromArray(int array[], size_t size) {
    for (size_t i = 0; i < size; i++) {
        std::cout << array[i];
    }
    
    return nullptr;
}
