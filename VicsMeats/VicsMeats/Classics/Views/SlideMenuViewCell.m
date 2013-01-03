//
//  SlideMenuViewCell.m
//  VicsMeats
//
//  Created by Toan Quach on 1/2/13.
//  Copyright (c) 2013 iPhoneDev. All rights reserved.
//

#import "SlideMenuViewCell.h"

@implementation SlideMenuViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupViewWithText:(NSString *)text andImageName:(NSString *)imgName andIndexPath:(NSIndexPath *)mIndexPath
{
    CGRect rect =  backgroundImageView.frame;
    if ((mIndexPath.section == 0 && mIndexPath.row == 1) || (mIndexPath.section == 1 && mIndexPath.row == 3))
    {
        rect.size.height = 64;
        backgroundImageView.frame = rect;
    }
    else if(mIndexPath.section == 2 && mIndexPath.row == 1)
    {
        rect.size.height = 60;
        backgroundImageView.frame = rect;
    }
    
    titleLabel.font = [UIFont fontWithName:kAppFont_Franchise_Bold size:27.5];
    titleLabel.text = text;
    
    backgroundImageView.image = [UIImage imageNamed:imgName];
}

@end
