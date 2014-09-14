//
//  WaltAppDelegate.h
//  Walt
//
//  Created by Athyuttam Reddy on 9/13/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppData.h"
#import <ESTBeaconManager.h>

@interface WaltAppDelegate : UIResponder <UIApplicationDelegate, ESTBeaconManagerDelegate> {
    AppData* data;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) ESTBeaconManager* beaconManager;

@end
