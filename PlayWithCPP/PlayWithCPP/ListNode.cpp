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

void ListNode::setNext(const ListNode *pNext) {
    mpNext = pNext;
}

ListNode *ListNode::fromArray(const int array[], size_t size) {
    ListNode *pHead = nullptr;
    ListNode *pTail = nullptr;
    
    for (size_t i = 0; i < size; i++) {        
        if (i == 0) {
            pHead = new ListNode(array[i], nullptr);
            pTail = pHead;
        } else {
            ListNode *pNext = new ListNode(array[i], nullptr);
            pTail->setNext(pNext);
            pTail = pNext;
        }
    }
    std::cout << std::endl;
    
    return pHead;
}

std::ostream& operator<<(std::ostream& os, const ListNode& listNode) {
    os << listNode.mnValue << " -> ";
    return os;
}
