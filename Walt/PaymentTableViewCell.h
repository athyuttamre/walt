//
//  PaymentTableViewCell.h
//  Walt
//
//  Created by Athyuttam Reddy on 9/14/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *itemIndex;
@property (strong, nonatomic) IBOutlet UILabel *itemName;
@property (strong, nonatomic) IBOutlet UILabel *itemPrice;
@property (strong, nonatomic) IBOutlet UILabel *itemSubTotal;
@property (strong, nonatomic) IBOutlet UILabel *itemTax;
@property (strong, nonatomic) IBOutlet UILabel *itemTotal;

@end
