//
//  BinaryNode.h
//  ObjectiveCCommandLinePlayground
//
//  Created by Mike Laursen on 11/27/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

@interface BinaryNode: NSObject

@property (strong, nonatomic) id value;
@property (strong, nonatomic) BinaryNode *left;
@property (strong, nonatomic) BinaryNode *right;

- (instancetype)init: (id)value left:(BinaryNode *)left right:(BinaryNode *)right;

+ (void)heapify:(BinaryNode *)node;


// Given an array with a bunch of int values, will make a binary tree out of
// it. No particular tree ordering guaranteed.
+ (BinaryNode *)makeTreeFromArray:(NSArray *)input;

// Makes a tree if you feed it an array in which the tree has been traversed
// depth-first left-right-parent order, with @0 for any nil children. Weird,
// but it works for quickly construction a tree. Cannot use 0 as the value of
// any of the nodes.
+ (BinaryNode *)makeTreeFromArray2:(NSArray *)input;

+ (void)traverseTreeBreadthFirst:(BinaryNode *)rootNode operation:(void (^)(id value)) operation;

+ (void)traverseTreeDepthFirst:(BinaryNode *)rootNode operation:(void (^)(id value)) operation;

+ (void)printTree:(BinaryNode *)rootNode;

@end
