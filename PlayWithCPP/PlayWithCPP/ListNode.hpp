//
//  ListNode.hpp
//  PlayWithCPP
//
//  Created by Mike Laursen on 11/30/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#ifndef ListNode_hpp
#define ListNode_hpp

#include <ostream>

template <class T> class ListNode {
public:    
    ListNode(T value, ListNode<T> *pNext)
    : mValue(value), mpNext(pNext) {
    }
    
    ~ListNode() {
    }
    
    ListNode<T> *next() const {
        return mpNext;
    }
    
    void setNext(ListNode<T> *pNext) {
        mpNext = pNext;
    }
    
    T value() const {
        return mValue;
    }
    
private:
    T mValue;
    ListNode<T> *mpNext;
    
    ListNode(const ListNode<T>& other);
    ListNode<T>& operator=(const ListNode<T>& other);
};

#endif /* ListNode_hpp */
