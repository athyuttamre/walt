//
//  AppData.h
//  Walt
//
//  Created by Athyuttam Reddy on 9/13/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppData : NSObject

@property (nonatomic) int leaveNumber;

+(AppData*) sharedData;

@end
