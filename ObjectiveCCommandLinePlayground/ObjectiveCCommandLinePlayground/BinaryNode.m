//
//  BinaryNode.m
//  ObjectiveCCommandLinePlayground
//
//  Created by Mike Laursen on 11/27/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryNode.h"

@implementation BinaryNode

- (instancetype)init: (id)value left:(BinaryNode *)left right:(BinaryNode *)right {
    _value = value;
    _left = left;
    _right = right;
    return self;
}

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

@end
