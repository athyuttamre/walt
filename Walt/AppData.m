//
//  AppData.m
//  Walt
//
//  Created by Athyuttam Reddy on 9/13/14.
//  Copyright (c) 2014 Walt Inc. All rights reserved.
//

#import "AppData.h"

@implementation AppData

@synthesize leaveNumber;

static AppData *sharedData = nil;

+(AppData*) sharedData
{
    //If our singleton instance has not been created (first time it is being accessed)
    if(sharedData == nil)
    {
        //create our singleton instance
        sharedData = [[AppData alloc] init];
        
        //collections (Sets, Dictionaries, Arrays) must be initialized
        //Note: our class does not contain properties, only the instance does
        //self.arrayOfDataToBeStored is invalid
    }
    
    //if the singleton instance is already created, return it
    return sharedData;
}

@end
