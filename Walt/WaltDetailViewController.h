//
//  WaltDetailViewController.h
//  Walt
//
//  Created by Athyuttam Reddy on 9/13/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaltDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
