//
//  CookWeightViewController.h
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CookWeightViewController : UIViewController
{
    IBOutlet UIImageView *backgroundImageView;
    
    IBOutlet UILabel *gramLabel;
    IBOutlet UILabel *kgLabel;
}

- (void)setupView;

- (IBAction)backButtonTouchUp:(id)sender;
- (IBAction)kgUpButtonTouchUp:(id)sender;
- (IBAction)gramUpButtonTouchUp:(id)sender;
- (IBAction)kgDownButtonTouchUp:(id)sender;
- (IBAction)gramDownButtonTouchUp:(id)sender;
- (IBAction)nextButtonTouchUp:(id)sender;
@end
