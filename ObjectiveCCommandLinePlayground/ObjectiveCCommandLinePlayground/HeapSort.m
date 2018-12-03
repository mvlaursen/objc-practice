//
//  HeapSort.m
//  ObjectiveCCommandLinePlayground
//
//  Created by Mike Laursen on 11/26/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryNode.h"
#import "HeapSort.h"

@implementation HeapSort

- (NSArray *)sort: (NSArray *)input usingComparator:(NSComparator)comparator {
    BinaryNode *root = [BinaryNode makeTreeFromArray:input];
    [BinaryNode heapify:root];
    NSArray *sorted = [BinaryNode mergeTree:root];
    return sorted;
}

@end
