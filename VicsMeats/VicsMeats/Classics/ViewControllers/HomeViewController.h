//
//  HomeViewController.h
//  VicsMeats
//
//  Created by Toan Quach on 12/26/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
{
    IBOutlet UIImageView *backgroundImageView;
    IBOutlet UIImageView *menuBgImageView;

    
}

- (void)setupView;

- (IBAction)cookitButtonTouchDown:(id)sender;
- (IBAction)cookitButtonTouchUp:(id)sender;

- (IBAction)meatButtonTouchDown:(id)sender;
- (IBAction)meatButtonTouchUp:(id)sender;

- (IBAction)suggestButtonTouchDown:(id)sender;
- (IBAction)suggestButtonTouchUp:(id)sender;

- (IBAction)askButtonTouchDown:(id)sender;
- (IBAction)askButtonTouchUp:(id)sender;

- (IBAction)slideMenuButtonTouchUp:(id)sender;
@end
