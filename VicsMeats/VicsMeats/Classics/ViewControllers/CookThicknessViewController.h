//
//  CookThicknessViewController.h
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CookThicknessView.h"

@interface CookThicknessViewController : UIViewController
{
    IBOutlet UIImageView *backgroundImageView;
    __weak IBOutlet CookThicknessView *cookThicknessView;
    IBOutlet UIButton *nextButton;
}

- (void)setupView;

- (IBAction)backButtonTouchUp:(id)sender;
- (IBAction)nextButtonTouchUp:(id)sender;
@end
