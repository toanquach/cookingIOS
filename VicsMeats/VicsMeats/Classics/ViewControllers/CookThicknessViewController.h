//
//  CookThicknessViewController.h
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CookThicknessViewController : UIViewController
{
    IBOutlet UIImageView *backgroundImageView;
    
}

- (void)setupView;

- (IBAction)backButtonTouchUp:(id)sender;
@end
