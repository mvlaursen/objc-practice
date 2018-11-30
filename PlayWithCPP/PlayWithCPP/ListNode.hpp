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

class ListNode {
public:
    ListNode();
    ListNode(int nValue, ListNode *pNext);
    ListNode(const ListNode&);
    ~ListNode();
    
    ListNode& operator=(const ListNode&);
    
    void setNext(const ListNode *pNext);
    
    static ListNode *fromArray(const int array[], size_t size);
    friend std::ostream& operator<<(std::ostream&, const ListNode *);

private:
    int mnValue;
    const ListNode *mpNext;
};

#endif /* ListNode_hpp */
