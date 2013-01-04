//
//  CookThicknessViewController.m
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import "CookThicknessViewController.h"
#import "CookItObject.h"

@interface CookThicknessViewController ()

@end

@implementation CookThicknessViewController

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

#pragma mark - setup View

- (void)setupView
{
    if (IS_IPHONE_5)
    {
        // set background for ip5
        backgroundImageView.image = [UIImage imageNamed:@"bg-home-2.png"];
        
        // resize height of background image
        CGRect frame = backgroundImageView.frame;
        frame.size.height = SCREEN_HEIGHT;
        backgroundImageView.frame = frame;
    }
    
    [[NSBundle mainBundle] loadNibNamed:@"CookThicknessView" owner:self options:nil];
    [cookThicknessView setupView];
    cookThicknessView.frame = CGRectMake(0, 460 - 305, 320, 305);
    [self.view addSubview:cookThicknessView];
    [self.view bringSubviewToFront:nextButton];
}

#pragma mark - Button Event

- (IBAction)backButtonTouchUp:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)nextButtonTouchUp:(id)sender
{
    CookItObject *cookit = [GlobalObjects sharedInstance].cookitObj;
    cookit.cookThicknessCm = [cookThicknessView getThicknessNumber];
}

@end
