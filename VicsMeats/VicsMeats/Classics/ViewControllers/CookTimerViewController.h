//
//  CookTimerViewController.h
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CookTimerViewController : UIViewController
{
    IBOutlet UILabel *methodLabel;
    IBOutlet UILabel *donenessLabel;
    IBOutlet UILabel *thicknessWeightLabel;
    IBOutlet UIImageView *line01ImageView;
    IBOutlet UIImageView *line02ImageView;
    IBOutlet UILabel *internalTempLabel;
    IBOutlet UILabel *cookingTimeLabel;
    IBOutlet UILabel *internalTempTimeLabel;
    IBOutlet UILabel *cookingTimeValueLabel;
    IBOutlet UIScrollView *mainScrollView;
 
    NSTimer *cookTimer;
}

- (void)setupView;
- (IBAction)slideMenuButtonTouchUp:(id)sender;

@end
