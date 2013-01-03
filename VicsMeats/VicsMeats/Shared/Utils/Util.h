//
//  Util.h
//  LSAManagerCoach
//
//  Created by Mac Mini on 11/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject

// Get resource from App
+ (NSString*)getBundle;

// check email valid
+ (BOOL)validEmail:(NSString*)emailString;

// check is number
+ (BOOL)validNumber:(NSString*)numberString;

// check valid date
+ (BOOL)validDate:(NSString*)dateString;

+ (UIColor *)myColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

@end
