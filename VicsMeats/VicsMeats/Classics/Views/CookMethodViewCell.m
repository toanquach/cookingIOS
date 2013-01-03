//
//  CookMethodViewCell.m
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import "CookMethodViewCell.h"

#import "CookWeightViewController.h"

@implementation CookMethodViewCell

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

#pragma mark - set up view

- (void)setupView:(NSString *)name
{
    methodImageView.image = [UIImage imageNamed:name];
}

#pragma mark - Button event

- (IBAction)mainButtonTouchDown:(id)sender
{
    borderView.borderType = BorderTypeDashed;
    borderView.borderColor = [UIColor blackColor];
    borderView.dashPattern = 8;
    borderView.spacePattern = 8;
    borderView.borderWidth = 3;
    borderView.cornerRadius = 20;
}

- (IBAction)mainButtonTouchUp:(id)sender
{
    [self performSelector:@selector(hiddenBorderView) withObject:nil afterDelay:0.5];
    CookWeightViewController *controller = [mainAppDelegate.storyBoard instantiateViewControllerWithIdentifier:@"cookWeightController"];
    [mainAppDelegate.navigationController pushViewController:controller animated:YES];
}

- (IBAction)mainButtonDragOutSide:(id)sender
{
    [self hiddenBorderView];
}

- (void)hiddenBorderView
{
    borderView.borderType = BorderTypeDashed;
    borderView.borderColor = [UIColor clearColor];
    borderView.dashPattern = 8;
    borderView.spacePattern = 8;
    borderView.borderWidth = 3;
    borderView.cornerRadius = 20;
}
@end
