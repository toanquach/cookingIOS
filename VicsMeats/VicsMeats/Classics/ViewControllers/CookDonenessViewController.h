//
//  CookDonenessViewController.h
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CookDonenessView.h"

@interface CookDonenessViewController : UIViewController
{
    IBOutlet UIScrollView *mainScrollView;
    IBOutlet UIImageView *backgroundImageView;
    IBOutlet CookDonenessView *cookDonenessView;
    IBOutlet UIButton *nextButton;
}

- (void)setupView;

- (IBAction)backButtonTouchUp:(id)sender;
@end
