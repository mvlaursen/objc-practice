//
//  main.m
//  ObjectiveCCommandLinePlayground
//
//  Created by Mike Laursen on 11/26/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeapSort.h"
#import "BinaryNode.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        HeapSort *mySort = [[HeapSort alloc] init];
        NSArray *unsorted = @[@1, @10, @9, @2, @3, @4, @7, @5, @6, @8];
        
        NSArray *sorted = [mySort sort:unsorted usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            NSNumber *num1 = (NSNumber *)obj1;
            NSNumber *num2 = (NSNumber *)obj2;
            return num1.intValue > num2.intValue;
        }];
        
        NSLog(@"%@", sorted);
        
        NSArray *fooFlat = @[@0, @0, @1, @0, @2, @0, @3, @0, @4, @0, @5, @0, @6, @0, @7, @0, @8, @0, @9];
        BinaryNode *fooTree = [BinaryNode makeTreeFromArray2:fooFlat];
        [BinaryNode printTree:fooTree];
         
        fooTree = [BinaryNode balanceTree:fooTree];
        [BinaryNode printTree:fooTree];
    }
    
    return 0;
}
