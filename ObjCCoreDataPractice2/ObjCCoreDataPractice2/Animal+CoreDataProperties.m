//
//  Animal+CoreDataProperties.m
//  ObjCCoreDataPractice2
//
//  Created by Mike Laursen on 12/2/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//
//

#import "Animal+CoreDataProperties.h"

@implementation Animal (CoreDataProperties)

+ (NSFetchRequest<Animal *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Animal"];
}

@dynamic commonName;
@dynamic genus;
@dynamic species;

@end
