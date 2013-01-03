//
//  SlideMenuHeaderView.m
//  VicsMeats
//
//  Created by Toan Quach on 1/2/13.
//  Copyright (c) 2013 iPhoneDev. All rights reserved.
//

#import "SlideMenuHeaderView.h"

@implementation SlideMenuHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setupViewWithText:(NSString *)title andImageName:(NSString *)imgName
{
    titleLabel.font = [UIFont fontWithName:kAppFont_Franchise_Bold size:27.5];
    titleLabel.text = title;
    
    backgroundImageView.image = [UIImage imageNamed:imgName];
}

@end
