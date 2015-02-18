//
//  DetailViewController.h
//  RefreshCachedImageTest
//
//  Created by Edgar Antunes on 18/02/2015.
//  Copyright (c) 2015 xpto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

