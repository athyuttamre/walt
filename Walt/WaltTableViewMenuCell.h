//
//  WaltTableViewMenuCell.h
//  Walt
//
//  Created by Athyuttam Reddy on 9/13/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaltTableViewMenuCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *menuItemImage;
@property (strong, nonatomic) IBOutlet UILabel *menuItemName;
@property (strong, nonatomic) IBOutlet UILabel *menuItemDescription;
@property (strong, nonatomic) IBOutlet UILabel *menuItemPrice;

@property (strong, nonatomic) IBOutlet UIButton *addItemButton;

@end
