//
//  Sort.h
//  ObjectiveCCommandLinePlayground
//
//  Created by Mike Laursen on 11/26/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

@protocol Sort
- (NSArray *)sort: (NSArray *)input usingComparator:(NSComparator)comparator;
@end
