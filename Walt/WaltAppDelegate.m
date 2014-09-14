//
//  WaltAppDelegate.m
//  Walt
//
//  Created by Athyuttam Reddy on 9/13/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import "WaltAppDelegate.h"
#import "Stripe.h"

NSString * const StripePublishableKey = @"pk_test_CJzbsigGnwMWH2E2fwP1rhV7";

@implementation WaltAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = (id)navigationController.topViewController;
    }
    
    [Stripe setDefaultPublishableKey:StripePublishableKey];
    
    self.beaconManager = [[ESTBeaconManager alloc] init];
    self.beaconManager.delegate = self;
    self.beaconManager.avoidUnknownStateBeacons = YES;
    
    data = [AppData sharedData];
    data.leaveNumber = 0;
    
    // create sample region with major value defined
    ESTBeaconRegion* region = [[ESTBeaconRegion alloc] initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID major:64331 minor:10945 identifier:@"EstimoteSampleRegion"];
    
    // start looking for estimote beacons in region
    // when beacon ranged beaconManager:didEnterRegion:
    // and beaconManager:didExitRegion: invoked
    [self.beaconManager startMonitoringForRegion:region];
    
    [self.beaconManager requestStateForRegion:region];
    
    /////////////////////////////////////////////////////////////
    // setup view
    
    // background
    
    //    self.productImage = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //    [self setProductImage];
    //    [self.view addSubview:self.productImage];
    
    [self.beaconManager startMonitoringForRegion:region];
    [self.beaconManager requestStateForRegion:region];
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    // the userInfo dictionary usually contains the same information as the notificationPayload dictionary above
    
    UINavigationController *rootViewController = (UINavigationController *) self.window.rootViewController;
    [rootViewController pushViewController:rootViewController animated:YES];
}

-(void)beaconManager:(ESTBeaconManager *)manager
      didEnterRegion:(ESTBeaconRegion *)region
{
    // iPhone/iPad entered beacon zone
    //    [self setProductImage];
    
    // present local notification
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.alertBody = @"Welcome to Kabob and Curry! Here's our menu.";
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    //    [[NSSound soundNamed:@"Frog"] play];
    NSLog((@"entered"));
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    
}

-(void)beaconManager:(ESTBeaconManager *)manager
       didExitRegion:(ESTBeaconRegion *)region
{
    // iPhone/iPad left beacon zone
    
    // present local notification
    if (data.leaveNumber == 1) {
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        notification.alertBody = @"Thank you for dining at Kabob and Curry! We hope to see you again soon.";
        notification.soundName = UILocalNotificationDefaultSoundName;
        NSLog((@"left"));
        
        [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    }
    else {
        data.leaveNumber = 1;
    }
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
