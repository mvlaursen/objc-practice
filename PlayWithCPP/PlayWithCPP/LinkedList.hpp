//
//  LinkedList.hpp
//  PlayWithCPP
//
//  Created by Mike Laursen on 11/30/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#ifndef LinkedList_hpp
#define LinkedList_hpp

#include "ListNode.hpp"

template <class T> class LinkedList {
public:
    LinkedList()
    : mpHead(nullptr) {
    }
    
    LinkedList(const LinkedList<T>& other) {
        throw;
    }
    
    LinkedList(T array[], size_t size) {
        ListNode<T> *pTail = nullptr;
        
        for (size_t i = 0; i < size; i++) {
            if (i == 0) {
                mpHead = new ListNode<T>(array[i], nullptr);
                pTail = mpHead;
            } else {
                ListNode<T> *pNext = new ListNode<T>(array[i], nullptr);
                pTail->setNext(pNext);
                pTail = pNext;
            }
        }
    }
    
    ~LinkedList() {
        ListNode<T> *pNode = mpHead;
        ListNode<T> *pNextNode = nullptr;
        
        while (pNode != nullptr) {
            pNextNode = pNode->next();
            delete pNode;
            pNode = pNextNode;
        }
    }
    
    LinkedList<T>& operator==(const LinkedList<T>& other) {
        throw;
    }
    
    friend std::ostream& operator<<(std::ostream& os, const LinkedList<T>& list) {
        for (const ListNode<T> *pNode = list.mpHead; pNode != nullptr; pNode = pNode->next()) {
            os << pNode->value() << " -> ";
        }
        
        os << "nullptr" << std::endl;
        return os;
    }
    
private:
    ListNode<T> *mpHead;
};

#endif /* LinkedList_hpp */
