//
//  HeapSort.m
//  ObjectiveCCommandLinePlayground
//
//  Created by Mike Laursen on 11/26/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeapSort.h"

@interface Node: NSObject

@property (strong, nonatomic) id value;
@property (strong, nonatomic) Node *left;
@property (strong, nonatomic) Node *right;

- (instancetype)init: (id)value left:(Node *)left right:(Node *)right;
+ (void)heapify:(Node *)node;
+ (Node *)makeTreeFromArray:(NSArray *)input;
+ (NSArray *)mergeTree:(Node *)node;

@end

@implementation Node

- (instancetype)init: (id)value left:(Node *)left right:(Node *)right {
    _value = value;
    _left = left;
    _right = right;
    return self;
}

+ (void)heapify:(Node *)node {
    if (node) {
        if (node.left) {
            if (node.left.value > node.value) {
                Node *temp = node.value;
                node.value = node.left.value;
                node.left.value = temp;
            }
            [Node heapify:node.left];
        }
        if (node.right) {
            if (node.right.value > node.value) {
                Node *temp = node.value;
                node.value = node.right.value;
                node.right.value = temp;
            }
            [Node heapify:node.right];
        }
   }
}

+ (Node *)makeTreeFromArray:(NSArray *)input {
    if (input.count) {
        NSArray *leftArray = nil;
        NSArray *rightArray = nil;
        
        if (input.count > 1) {
            NSArray *remaining = [input subarrayWithRange:NSMakeRange(1, input.count - 1)];
            leftArray = [remaining subarrayWithRange:NSMakeRange(0, remaining.count / 2)];
            rightArray = [remaining subarrayWithRange:NSMakeRange(leftArray.count, remaining.count - leftArray.count)];
        }
        
        Node *node = [[Node alloc] init:input[0] left:[Node makeTreeFromArray:leftArray] right:[Node makeTreeFromArray:rightArray]];
        return node;
    } else {
        return nil;
    }
}

+ (NSArray *)mergeTree:(Node *)node {
    NSMutableArray *merged = [[NSMutableArray alloc] init];
    
    if (node) {
        NSArray *leftArray = [Node mergeTree:node.left];
        uint leftIndex = 0;
        NSArray *rightArray = [Node mergeTree:node.right];
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
    Node *root = [Node makeTreeFromArray:input];
    [Node heapify:root];
    NSArray *sorted = [Node mergeTree:root];
    return sorted;
}

@end
