//
//  DummySort.m
//  ObjectiveCCommandLinePlayground
//
//  Created by Mike Laursen on 11/26/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DummySort.h"

@implementation DummySort

- (NSArray *)sort: (NSArray *)input usingComparator:(NSComparator)comparator {
     return [input sortedArrayUsingComparator:comparator];
}

@end
