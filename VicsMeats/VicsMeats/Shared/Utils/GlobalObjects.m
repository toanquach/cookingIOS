//
//  GlobalObjects.m
//  LSAManagerCoach
//
//  Created by Mac Mini on 11/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GlobalObjects.h"
#import "CookItObject.h"

@implementation GlobalObjects

@synthesize userDefaults;
@synthesize cookitObj;

+ (GlobalObjects *)sharedInstance
{
    //the instance of this class is stored here
    static GlobalObjects *myInstance = nil;
    //check to see if an instance already exists
    
    if (nil == myInstance)
    {
        myInstance = [[[self class] alloc]init];
        myInstance.userDefaults = [NSUserDefaults standardUserDefaults];
        myInstance.cookitObj = nil;
    }
    return myInstance;
}

@end
