//
//  HomeViewController.m
//  VicsMeats
//
//  Created by Toan Quach on 12/26/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)viewWillAppear:(BOOL)animated
{
    self.view.userInteractionEnabled = YES;
}

#pragma mark - Setup View

// init font, color, background of view

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
}


#pragma mark - Button Event

- (IBAction)cookitButtonTouchDown:(id)sender
{
    menuBgImageView.image = [UIImage imageNamed:@"bg-nav-03.png"];
}

- (IBAction)cookitButtonTouchUp:(id)sender
{
    menuBgImageView.image = [UIImage imageNamed:@"bg-nav.png"];
}

- (IBAction)meatButtonTouchDown:(id)sender
{
    menuBgImageView.image = [UIImage imageNamed:@"bg-nav-02.png"];    
}

- (IBAction)meatButtonTouchUp:(id)sender
{
    menuBgImageView.image = [UIImage imageNamed:@"bg-nav.png"];
}

- (IBAction)suggestButtonTouchDown:(id)sender
{
    menuBgImageView.image = [UIImage imageNamed:@"bg-nav-01.png"];    
}

- (IBAction)suggestButtonTouchUp:(id)sender
{
    menuBgImageView.image = [UIImage imageNamed:@"bg-nav.png"];
}

- (IBAction)askButtonTouchDown:(id)sender
{
    menuBgImageView.image = [UIImage imageNamed:@"bg-nav-04.png"];    
}

- (IBAction)askButtonTouchUp:(id)sender
{
    menuBgImageView.image = [UIImage imageNamed:@"bg-nav.png"];
}

- (IBAction)slideMenuButtonTouchUp:(id)sender
{
    [mainAppDelegate showSlideMenu];
}


@end
