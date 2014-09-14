//
//  MenuItem.m
//  BeaconSample
//
//  Created by Krishna Chaitanya Aluru on 9/13/14.
//  Copyright (c) 2014 Krishna Chaitanya Aluru. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem {
    
}

- (id)initWithName:(NSString *)name withCategory:(NSString *)category withDescription:(NSString *)itemDescription withImage:(UIImage *)thumbnail withPrice:(double)price withSpice:(int)spice withVegetarian:(BOOL)isVegetarian withTopBool:(BOOL)isTopPick withCheckValue:(BOOL)isChecked
{
    self = [super init];
    
    self.name = name;
    self.category = category;
    self.itemDescription = itemDescription;
    self.thumbnail = thumbnail;
    self.price = price;
    self.spiceLevel = spice;
    self.isVegetarian = isVegetarian;
    self.isTopPick = isTopPick;
    self.isChecked = isChecked;
    
    return self;
}

@end