//
//  WaltConfirmOrderTableViewController.h
//  Walt
//
//  Created by Athyuttam Reddy on 9/14/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"

@interface WaltConfirmOrderTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *selectedItems;
@property (nonatomic, strong) Restaurant *restaurant;
@property (strong, nonatomic) IBOutlet UIButton *confirmOrderButton;
@property (strong, nonatomic) IBOutlet UIScrollView *bottomFloatingView;

@end
