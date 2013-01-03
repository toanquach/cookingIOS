//
//  GlobalObjects.h
//  LSAManagerCoach
//
//  Created by Mac Mini on 11/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalObjects : NSObject
{
    NSUserDefaults *userDefaults;
}

@property (strong, nonatomic) NSUserDefaults *userDefaults;

//message from which our instance is obtained
+ (GlobalObjects *)sharedInstance;

@end
