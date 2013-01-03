//
//  Util.m
//  LSAManagerCoach
//
//  Created by Mac Mini on 11/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Util.h"

@implementation Util

+ (NSString*)getBundle
{
    return [[NSBundle mainBundle] resourcePath];
}

+ (BOOL)validEmail:(NSString*)emailString
{
    NSString *regExPattern = @"^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$";
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    DLog(@"regExMatches: %i", regExMatches);
    if (regExMatches == 0) {
        return NO;
    } else
        return YES;
}

+ (BOOL)validNumber:(NSString*)numberString
{
    NSCharacterSet* nonNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange r = [numberString rangeOfCharacterFromSet: nonNumbers];
    return r.location == NSNotFound;
}

+ (BOOL)validDate:(NSString*)dateString
{
    NSString *regExPattern = @"^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\\d\\d$";
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:dateString options:0 range:NSMakeRange(0, [dateString length])];
    DLog(@"regExMatches: %i", regExMatches);
    if (regExMatches == 0) {
        return NO;
    } else
        return YES;
}

+ (UIColor *)myColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

@end
