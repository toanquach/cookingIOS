//
//  CookThicknessView.h
//  VicsMeats
//
//  Created by Toan Quach on 1/3/13.
//  Copyright (c) 2013 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CookThicknessView : UIView
{
    IBOutlet UIImageView *sliderImageView;
    BOOL isTouchInSlider;
    IBOutlet UIImageView *thicknessNumberImageView;
    float thicknessNumber;
    CGPoint centerPoint;
}

- (void)setupView;
- (IBAction)button1CMTouchUp:(id)sender;
- (IBAction)button2CMTouchUp:(id)sender;
- (IBAction)button3CMTouchUp:(id)sender;
- (IBAction)button4CMTouchUp:(id)sender;

- (void)setThickNessImageView:(NSString *)imageName;
- (void)updateThicknessNumber:(CGPoint) locationPoint andType:(BOOL)flag;

@end
