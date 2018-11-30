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
    ListNode()
    : mValue(0), mpNext(nullptr) {
    }
    
    ListNode(int value, ListNode<T> *pNext)
    : mValue(value), mpNext(pNext) {
    }

    ListNode(const ListNode<T>& other)
    : mValue(other.mValue), mpNext(other.mpNext) {
    }
    
    ~ListNode() {
    }
    
    ListNode<T>& operator=(const ListNode<T>& other) {
        if (this != &other) {
            mValue = other.mValue;
            mpNext = other.mpNext;
        }
        
        return *this;
    }
    
    void setNext(ListNode<T> *pNext) {
        mpNext = pNext;
    }
    
    static ListNode<T> *fromArray(const T array[], size_t size) {
        ListNode<T> *pHead = nullptr;
        ListNode<T> *pTail = nullptr;
        
        for (size_t i = 0; i < size; i++) {
            if (i == 0) {
                pHead = new ListNode<T>(array[i], nullptr);
                pTail = pHead;
            } else {
                ListNode<T> *pNext = new ListNode<T>(array[i], nullptr);
                pTail->setNext(pNext);
                pTail = pNext;
            }
        }
        
        return pHead;
    }
    
    static void deleteList(ListNode<T> *pHead) {
        ListNode<T> *pNode = pHead;
        ListNode<T> *pNextNode = nullptr;
        
        while (pNode != nullptr) {
            pNextNode = pNode->mpNext;
            delete pNode;
            pNode = pNextNode;
        }
    }
    
    friend std::ostream& operator<<(std::ostream& os, const ListNode<T> *pHead) {
        for (const ListNode<T> *pNode = pHead; pNode != nullptr; pNode = pNode->mpNext) {
            os << pNode->mValue << " -> ";
        }
    
        os << "nullptr" << std::endl;
        return os;
    }


private:
    T mValue;
    ListNode<T> *mpNext;
};

#endif /* ListNode_hpp */
