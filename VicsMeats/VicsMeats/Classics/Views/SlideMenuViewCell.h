//
//  SlideMenuViewCell.h
//  VicsMeats
//
//  Created by Toan Quach on 1/2/13.
//  Copyright (c) 2013 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideMenuViewCell : UITableViewCell
{
    IBOutlet UIImageView *backgroundImageView;
    IBOutlet UILabel *titleLabel;
    IBOutlet UIImageView *settingIconImageView;
    IBOutlet UIView *percentView;
    IBOutlet UIView *numberView;
    IBOutlet UILabel *percentLabel;
    IBOutlet UILabel *numberLabel;
}

- (void)setupViewWithText:(NSString *)text andImageName:(NSString *)imgName andIndexPath:(NSIndexPath *)mIndexPath;

@end
