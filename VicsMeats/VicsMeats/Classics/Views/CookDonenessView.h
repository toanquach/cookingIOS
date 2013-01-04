//
//  CookDonenessView.h
//  VicsMeats
//
//  Created by Toan Quach on 1/4/13.
//  Copyright (c) 2013 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CookDonenessView : UIView
{
    IBOutlet UIImageView *rullerImageView;
    IBOutlet UIImageView *sliderImageView;
    IBOutlet UIButton *blueButton;
    IBOutlet UIButton *rareButton;
    IBOutlet UIButton *mediumRareButton;
    IBOutlet UIButton *mediumButton;
    IBOutlet UIButton *mediumWellButton;
    IBOutlet UIButton *wellDoneButton;
    BOOL isTouchInSlider;
    int donenessIndex;
}

@property (nonatomic,retain) UIScrollView *parentScrollView;
- (void)setupView;

- (IBAction)blueButtonTouchUp:(id)sender;
- (IBAction)rareButtonTouchUp:(id)sender;
- (IBAction)mediumRareButtonTouchUp:(id)sender;
- (IBAction)mediumButtonTouchUp:(id)sender;
- (IBAction)mediumWellButtonTouchUp:(id)sender;
- (IBAction)wellDoneButtonTouchUp:(id)sender;

- (void)updateDonenessIndex:(CGPoint) locationPoint andType:(BOOL)flag;
- (void)setSelectedDoneness:(int)tag;
- (void)sliderAnimationWithPoint:(CGPoint)point;

@end
