//
//  MasterViewController.m
//  RefreshCachedImageTest
//
//  Created by Edgar Antunes on 18/02/2015.
//  Copyright (c) 2015 xpto. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "UIImageView+WebCache.h"

@interface MasterViewController ()
@property NSArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.objects = @[@"https://dl.dropbox.com/s/wfv0j9tece0y03j/apple.jpg"];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  [self.tableView reloadData];
}


#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.objects.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
  
  NSString *object = self.objects[indexPath.row];
  cell.textLabel.text = @"bla";
  [cell.imageView sd_setImageWithURL:[NSURL URLWithString:object]
                    placeholderImage:nil
                             options:SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                               NSLog(@"Image error: %@, cacheType: %@", error, [self cacheTypeStringWithCacheType:cacheType]);
                               [cell setNeedsLayout];
                               [cell layoutIfNeeded];
                             }];
  return cell;
}

- (NSString *)cacheTypeStringWithCacheType:(SDImageCacheType)cacheType
{
  switch (cacheType) {
    case SDImageCacheTypeDisk: return @"Disk";
    case SDImageCacheTypeMemory: return @"Memory";
    case SDImageCacheTypeNone: return @"None";
  }
}

@end
