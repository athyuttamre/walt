//
//  MenuItem.h
//  BeaconSample
//
//  Created by Krishna Chaitanya Aluru on 9/13/14.
//  Copyright (c) 2014 Krishna Chaitanya Aluru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Restaurant.h"

@interface MenuItem : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *itemDescription;
@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic, assign) double price;
@property (nonatomic, assign) int spiceLevel;
@property (nonatomic, assign) BOOL isVegetarian;
@property (nonatomic, assign) BOOL isTopPick;
@property (nonatomic, assign) BOOL isChecked;



- (id)initWithName:(NSString *)name withCategory:(NSString *)category withDescription:(NSString *)itemDescription withImage:(UIImage *)thumbnail withPrice:(double)price withSpice:(int)spice withVegetarian:(BOOL)isVegetarian withTopBool:(BOOL)isTopPick withCheckValue:(BOOL)isChecked;

@end