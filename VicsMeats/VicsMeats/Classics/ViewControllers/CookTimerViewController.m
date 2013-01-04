//
//  CookTimerViewController.m
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import "CookTimerViewController.h"

@interface CookTimerViewController ()

@end

@implementation CookTimerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setupView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView
{
    methodLabel.font = [UIFont fontWithName:kAppFont_Pacifico size:17];
    donenessLabel.font = [UIFont fontWithName:kAppFont_Pacifico size:17];
    thicknessWeightLabel.font = [UIFont fontWithName:kAppFont_Pacifico size:17];
    
    cookingTimeLabel.font = [UIFont fontWithName:kAppFont_UniversLTStd_LightUltraCn size:21];
    internalTempLabel.font = [UIFont fontWithName:kAppFont_UniversLTStd_LightUltraCn size:21];
    
    cookingTimeValueLabel.font = [UIFont fontWithName:kAppFont_Franchise_Bold size:61];
    internalTempTimeLabel.font = [UIFont fontWithName:kAppFont_Franchise_Bold size:61];
    
    internalTempTimeLabel.text = @"130";
    
    mainScrollView.contentSize = CGSizeMake(320, 555);
}

- (IBAction)slideMenuButtonTouchUp:(id)sender
{
    [mainAppDelegate showSlideMenu];
}
@end
