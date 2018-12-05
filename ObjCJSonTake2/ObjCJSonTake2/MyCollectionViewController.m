//
//  MyCollectionViewController.m
//  ObjCJSonTake2
//
//  Created by Mike Laursen on 12/4/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "MyCollectionViewCell.h"

@interface MyCollectionViewController ()

/*
 * Each array member is a dictionary containing the parsed JSON data for a
 * photo, plus a kThumbnailImageKey entry whose value is either the thumbnail
 * UIImage or a placeholder thumbnail UIImage, if the thumbnail has not
 * finished loading.
 */
@property (nonatomic, strong) NSArray *photos;

@end

@implementation MyCollectionViewController

static NSString * const reuseIdentifier = @"MyCell";
static NSString * const kPhotosJSONURL = @"https://jsonplaceholder.typicode.com/photos";
static NSString * const kThumbnailImageKey = @"thumbnailImage";
static NSString * const kThumbnailURL = @"thumbnailUrl";
static NSUInteger const kMaxPhotos = 10;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count = self.photos.count;
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSDictionary *photoDict = (NSDictionary *)self.photos[indexPath.row];
    UIImage *thumbnailImage = [photoDict valueForKey:kThumbnailImageKey];
    cell.imageView.image = thumbnailImage;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

#pragma mark - Data

- (NSArray *)photos {
    if (!_photos) {
        NSURL *photoJSONURL = [NSURL URLWithString:kPhotosJSONURL];
        NSURLSessionDataTask *photoJSONTask = [[NSURLSession sharedSession] dataTaskWithURL:photoJSONURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            // TODO: Check error and HTTP status.
            
            NSError *jsonParsingError;
            self.photos = (NSArray *)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonParsingError];
            // The sample data has 5000 photos. Cut it down to a more
            // reasonable size.
            self.photos = [self.photos subarrayWithRange:NSMakeRange(0, kMaxPhotos)];
            UIImage *placeholder = [UIImage imageNamed:@"placeholder"];
            
            for (NSUInteger iPhoto = 0; iPhoto < self.photos.count; iPhoto++) {
                NSMutableDictionary *photoDict = (NSMutableDictionary *)self.photos[iPhoto];
                [photoDict setValue:placeholder forKey:kThumbnailImageKey];
                NSString *thumbnailPath = [photoDict valueForKey:kThumbnailURL];
                NSURL *thumbnailURL = [NSURL URLWithString:thumbnailPath];
                
                NSURLSessionTask *thumbnailDownloadTask = [[NSURLSession sharedSession] dataTaskWithURL:thumbnailURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                    UIImage *thumbnailImage = [UIImage imageWithData:data];
                    [photoDict setValue:thumbnailImage forKey:kThumbnailImageKey];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        NSMutableArray *indexPaths = [NSMutableArray arrayWithCapacity:0];
                        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:iPhoto inSection:0];
                        [indexPaths addObject:indexPath];
                        [self.collectionView reloadItemsAtIndexPaths:indexPaths];
                    });
                }];
                [thumbnailDownloadTask resume];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        }];
        [photoJSONTask resume];
    }
    
    return _photos;
}

@end
