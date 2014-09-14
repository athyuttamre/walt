//
//  Restaurant.m
//  BeaconSample
//
//  Created by Krishna Chaitanya Aluru on 9/13/14.
//  Copyright (c) 2014 Krishna Chaitanya Aluru. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

-(id)initWithName:(NSString *)name withLocation:(NSString *)location withImage:(UIImage *)landingImage withRating:(int)rating withMenuDescription:(NSString *)menuDescription withMenu:(NSDictionary *)menu
{
    self = [super init];
    
    self.name = name;
    self.location = location;
    self.landingImage = landingImage;
    self.rating = rating;
    self.menuDescription = menuDescription;
    self.menu = menu;
    
    return self;
}

@end