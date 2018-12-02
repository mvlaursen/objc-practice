//
//  AppDelegate.h
//  ObjCCoreDataPractice2
//
//  Created by Mike Laursen on 12/2/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

