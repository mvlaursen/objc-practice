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

/*
 * If I try to use an anonymous extension for this extension, I get build
 * errors. I'm not sure why.
 */
@interface BinaryNode (HeapSortExtension)

+ (NSArray *)mergeTree:(BinaryNode *)node;

@end

@implementation BinaryNode (HeapSortExtension)

+ (NSArray *)mergeTree:(BinaryNode *)node {
    NSMutableArray *merged = [[NSMutableArray alloc] init];
    
    if (node) {
        NSArray *leftArray = [BinaryNode mergeTree:node.left];
        uint leftIndex = 0;
        NSArray *rightArray = [BinaryNode mergeTree:node.right];
        uint rightIndex = 0;
        
        while (leftIndex < leftArray.count || rightIndex < rightArray.count) {
            if (leftIndex < leftArray.count && rightIndex < rightArray.count) {
                if (leftArray[leftIndex] <= rightArray[rightIndex]) {
                    [merged addObject:leftArray[leftIndex++]];
                } else {
                    [merged addObject:rightArray[rightIndex++]];
                }
            } else if (leftIndex < leftArray.count) {
                [merged addObject:leftArray[leftIndex++]];
            } else if (rightIndex < rightArray.count) {
                [merged addObject:rightArray[rightIndex++]];
            }
        }
        
        [merged addObject:node.value];
    }
    
    return merged;
}

@end

@implementation HeapSort

- (NSArray *)sort: (NSArray *)input usingComparator:(NSComparator)comparator {
    BinaryNode *root = [BinaryNode makeTreeFromArray:input];
    [BinaryNode heapify:root];
    NSArray *sorted = [BinaryNode mergeTree:root];
    return sorted;
}

@end
