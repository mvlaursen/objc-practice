//
//  PhotoViewController.h
//  ObjCJSonTake2
//
//  Created by Mike Laursen on 12/4/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoViewController : UIViewController

@property (strong, nonatomic) NSDictionary *photoDict;

@property (weak, nonatomic) IBOutlet UILabel *photoTitle;

@end

NS_ASSUME_NONNULL_END
