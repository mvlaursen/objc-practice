//
//  Animal+CoreDataProperties.h
//  ObjCCoreDataPractice2
//
//  Created by Mike Laursen on 12/2/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//
//

#import "Animal+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Animal (CoreDataProperties)

+ (NSFetchRequest<Animal *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *commonName;
@property (nullable, nonatomic, copy) NSString *genus;
@property (nullable, nonatomic, copy) NSString *species;

@end

NS_ASSUME_NONNULL_END
