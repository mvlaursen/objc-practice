//
//  BinaryNode.m
//  ObjectiveCCommandLinePlayground
//
//  Created by Mike Laursen on 11/27/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryNode.h"

@interface BinaryNode ()

+ (void)traverseTreeDepthFirstAux: (NSMutableArray *)stack node:(BinaryNode *)node operation:(void (^)(id value)) operation;

+ (void)printTreeAux:(NSMutableString *)output depth:(NSUInteger)depth node:(BinaryNode *)node;

@end

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

+ (void)traverseTreeDepthFirst: (BinaryNode *)rootNode operation:(void (^)(id value)) operation {
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    [BinaryNode traverseTreeDepthFirstAux:stack node:rootNode operation:operation];
    if (stack.count > 0) {
        for (NSUInteger i = stack.count; i > 0; i--) {
            operation(((BinaryNode *)stack[i - 1]).value);
        }
    }
}

+ (void)traverseTreeDepthFirstAux: (NSMutableArray *)stack node:(BinaryNode *)node operation:(void (^)(id value)) operation {
    if (node) {
        [stack addObject:node];
        if (node.right) {
            [BinaryNode traverseTreeDepthFirstAux:stack node:node.right operation:operation];
        }
        if (node.left) {
            [BinaryNode traverseTreeDepthFirstAux:stack node:node.left operation:operation];
        }
    }
}

+ (void)printTreeAux:(NSMutableString *)output depth:(NSUInteger)depth node:(BinaryNode *)node {
    if (node) {
        NSMutableString *line = [NSMutableString stringWithString:@"=="];
        for (int i = 0; i < depth; i++)
            [line appendString:@"=="];
        [line appendFormat:@"> %@\n", node.value];
        [output appendString:line];
        
        if (node.left) {
            [BinaryNode printTreeAux:output depth:depth + 1 node:node.left];
        }
        if (node.right) {
            [BinaryNode printTreeAux:output depth:depth + 1 node:node.right];
        }
    }
}

+ (void)printTree: (BinaryNode *)rootNode {
    NSMutableString *output = [[NSMutableString alloc] init];
    [output appendString:@"\n"];
    NSUInteger depth = 0;
    [BinaryNode printTreeAux:output depth:depth node:rootNode];
    NSLog(@"%@", output);
}

@end
