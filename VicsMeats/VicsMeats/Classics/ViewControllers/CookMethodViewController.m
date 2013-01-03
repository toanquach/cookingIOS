//
//  CookMethodViewController.m
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import "CookMethodViewController.h"

@interface CookMethodViewController ()

@end

@implementation CookMethodViewController

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
    
    // create list item method
    listMethod = [[NSMutableArray alloc]init];
    [listMethod addObject:@"method_bg_grill.png"];
    [listMethod addObject:@"method_bg_slowcook.png"];
    [listMethod addObject:@"method_bg_roast.png"];
    [listMethod addObject:@"method_bg_stirfry.png"];
    [listMethod addObject:@"method_bg_panfry.png"];
    [myTableView reloadData];
}

#pragma mark - Button Event

- (IBAction)backButtonTouchUp:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)infosButtonTouchUp:(id)sender
{
    
}

#pragma mark - UITable Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listMethod count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"cellIdentifier";
    
    cookMethodViewCell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (cookMethodViewCell == nil)
    {
        [[NSBundle mainBundle] loadNibNamed:@"CookMethodViewCell" owner:self options:nil];
        cookMethodViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cookMethodViewCell setupView:[listMethod objectAtIndex:indexPath.row]];
    
    return cookMethodViewCell;
}

@end
