//
//  GlobalObjects.h
//  LSAManagerCoach
//
//  Created by Mac Mini on 11/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CookItObject;

@interface GlobalObjects : NSObject
{
    NSUserDefaults *userDefaults;
    CookItObject *cookitObj;
}

@property (strong, nonatomic) NSUserDefaults *userDefaults;
@property (strong, nonatomic) CookItObject *cookitObj;

//message from which our instance is obtained
+ (GlobalObjects *)sharedInstance;

@end
