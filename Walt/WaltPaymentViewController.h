//
//  WaltPaymentViewController.h
//  Walt
//
//  Created by Athyuttam Reddy on 9/14/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaltPaymentViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

//@property (strong, nonatomic) IBOutlet UIButton *saveButton;

@property (nonatomic, assign) NSMutableArray *selectedItems;

@end
