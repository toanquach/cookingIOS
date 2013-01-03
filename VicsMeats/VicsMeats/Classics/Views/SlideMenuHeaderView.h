//
//  SlideMenuHeaderView.h
//  VicsMeats
//
//  Created by Toan Quach on 1/2/13.
//  Copyright (c) 2013 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideMenuHeaderView : UIView
{
    IBOutlet UIImageView *backgroundImageView;
    IBOutlet UILabel *titleLabel;
    
}

- (void)setupViewWithText:(NSString *)title andImageName:(NSString *)imgName;

@end
