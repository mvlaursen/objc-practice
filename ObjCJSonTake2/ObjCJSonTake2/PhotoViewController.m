//
//  PhotoViewController.m
//  ObjCJSonTake2
//
//  Created by Mike Laursen on 12/4/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.photoDict) {
        self.photoTitle.text = [self.photoDict valueForKey:@"title"];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
