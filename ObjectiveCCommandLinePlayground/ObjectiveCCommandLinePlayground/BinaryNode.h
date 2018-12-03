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

+ (BinaryNode *)makeTreeFromArray:(NSArray *)input;

+ (NSArray *)mergeTree:(BinaryNode *)node;

@end
