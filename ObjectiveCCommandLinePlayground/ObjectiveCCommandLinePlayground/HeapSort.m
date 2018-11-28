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

@interface BinaryNode ()

+ (void)heapify:(BinaryNode *)node;
+ (BinaryNode *)makeTreeFromArray:(NSArray *)input;
+ (NSArray *)mergeTree:(BinaryNode *)node;

@end

@implementation BinaryNode

+ (void)heapify:(BinaryNode *)node {
    if (node) {
        if (node.left) {
            if (node.left.value > node.value) {
                BinaryNode *temp = node.value;
                node.value = node.left.value;
                node.left.value = temp;
            }
            [BinaryNode heapify:node.left];
        }
        if (node.right) {
            if (node.right.value > node.value) {
                BinaryNode *temp = node.value;
                node.value = node.right.value;
                node.right.value = temp;
            }
            [BinaryNode heapify:node.right];
        }
   }
}

+ (BinaryNode *)makeTreeFromArray:(NSArray *)input {
    if (input.count) {
        NSArray *leftArray = nil;
        NSArray *rightArray = nil;
        
        if (input.count > 1) {
            NSArray *remaining = [input subarrayWithRange:NSMakeRange(1, input.count - 1)];
            leftArray = [remaining subarrayWithRange:NSMakeRange(0, remaining.count / 2)];
            rightArray = [remaining subarrayWithRange:NSMakeRange(leftArray.count, remaining.count - leftArray.count)];
        }
        
        BinaryNode *node = [[BinaryNode alloc] init:input[0] left:[BinaryNode makeTreeFromArray:leftArray] right:[BinaryNode makeTreeFromArray:rightArray]];
        return node;
    } else {
        return nil;
    }
}

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
