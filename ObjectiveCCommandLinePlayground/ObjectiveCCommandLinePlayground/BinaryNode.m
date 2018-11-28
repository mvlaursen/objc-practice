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

@end
