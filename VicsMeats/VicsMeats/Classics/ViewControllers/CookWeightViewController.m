//
//  CookWeightViewController.m
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import "CookWeightViewController.h"
#import "CookItObject.h"

@interface CookWeightViewController ()

@end

@implementation CookWeightViewController

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

#pragma mark - Setup View

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
    
    kgLabel.font = [UIFont fontWithName:kAppFont_Franchise_Bold size:45];
    gramLabel.font = [UIFont fontWithName:kAppFont_Franchise_Bold size:45];
}

#pragma mark - Button Event

- (IBAction)backButtonTouchUp:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)kgUpButtonTouchUp:(id)sender
{
    int value = [kgLabel.text intValue];
    value++;
    kgLabel.text = [NSString stringWithFormat:@"%d",value];
}

- (IBAction)gramUpButtonTouchUp:(id)sender
{
    int value = [gramLabel.text intValue];
    value += 100;
    if (value == 1000)
    {
        value = 0;
    }
    gramLabel.text = [NSString stringWithFormat:@"%d",value];
}

- (IBAction)kgDownButtonTouchUp:(id)sender
{
    int value = [kgLabel.text intValue];
    value--;
    if (value < 0)
    {
        value = 0;
    }
    kgLabel.text = [NSString stringWithFormat:@"%d",value];
}

- (IBAction)gramDownButtonTouchUp:(id)sender
{
    int value = [gramLabel.text intValue];
    value -= 100;
    if (value < 0)
    {
        value = 900;
    }
    gramLabel.text = [NSString stringWithFormat:@"%d",value];
}

- (IBAction)nextButtonTouchUp:(id)sender
{
    CookItObject *cookit = [GlobalObjects sharedInstance].cookitObj;
    cookit.cookWeightKg = [kgLabel.text intValue];
    cookit.cookWeightGram = [gramLabel.text intValue];
}

@end
