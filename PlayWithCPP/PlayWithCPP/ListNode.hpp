//
//  ListNode.hpp
//  PlayWithCPP
//
//  Created by Mike Laursen on 11/30/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#ifndef ListNode_hpp
#define ListNode_hpp

class ListNode {
public:
    ListNode();
    ListNode(int nValue, ListNode *pNext);
    ListNode(const ListNode&);
    ~ListNode();
    
    ListNode& operator=(const ListNode&);
    
    static ListNode *fromArray(int array[], size_t size);

private:
    int mnValue;
    ListNode *mpNext;
};

#endif /* ListNode_hpp */
