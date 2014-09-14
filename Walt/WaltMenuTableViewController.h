//
//  WaltMenuTableViewController.h
//  Walt
//
//  Created by Athyuttam Reddy on 9/13/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"
#import "WaltConfirmOrderTableViewController.h"

@interface WaltMenuTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *restaurantName;
@property (strong, nonatomic) IBOutlet UILabel *restaurantDescription;
@property (strong, nonatomic) IBOutlet UIImageView *restaurantStars;

@property (strong, nonatomic) IBOutlet UIScrollView *bottomFloatingView;
@property (strong, nonatomic) IBOutlet UIButton *reviewOrderButton;

@property (nonatomic, strong) Restaurant *restaurant;

@end
