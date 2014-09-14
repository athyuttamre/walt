//
//  WaltReviewOrderTableViewCell.h
//  Walt
//
//  Created by Athyuttam Reddy on 9/14/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaltReviewOrderTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *itemIndex;
@property (strong, nonatomic) IBOutlet UILabel *itemName;
@property (strong, nonatomic) IBOutlet UILabel *itemStatus;
@property (strong, nonatomic) IBOutlet UILabel *itemPrice;

@end
