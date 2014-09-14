//
//  Restaurant.h
//  BeaconSample
//
//  Created by Krishna Chaitanya Aluru on 9/13/14.
//  Copyright (c) 2014 Krishna Chaitanya Aluru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) UIImage *landingImage;
@property (nonatomic, assign) int rating;
@property (nonatomic, strong) NSString *menuDescription;
@property (nonatomic, strong) NSDictionary *menu;

-(id)initWithName:(NSString *)name withLocation:(NSString *)location withImage:(UIImage *)landingImage withRating:(int)rating withMenuDescription:(NSString *)menuDescription withMenu:(NSDictionary *)menu;

@end