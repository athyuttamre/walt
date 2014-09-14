//
//  WaltTableViewCell.h
//  Walt
//
//  Created by Athyuttam Reddy on 9/13/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaltTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *restaurantName;
@property (strong, nonatomic) IBOutlet UILabel *restaurantDescription;
@property (strong, nonatomic) IBOutlet UIImageView *restaurantRating;

@end
