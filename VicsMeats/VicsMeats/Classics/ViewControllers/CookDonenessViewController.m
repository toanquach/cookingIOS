//
//  CookDonenessViewController.m
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import "CookDonenessViewController.h"

@interface CookDonenessViewController ()

@end

@implementation CookDonenessViewController

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

#pragma mark - Setup Voew

- (void)setupView
{
    mainScrollView.contentSize = CGSizeMake(320, 480);
    
    if (IS_IPHONE_5)
    {
        // set background for ip5
        backgroundImageView.image = [UIImage imageNamed:@"bg-home-2.png"];
        
        // resize height of background image
        CGRect frame = backgroundImageView.frame;
        frame.size.height = SCREEN_HEIGHT;
        backgroundImageView.frame = frame;
    }
}

#pragma mark - Button Event

- (IBAction)backButtonTouchUp:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
