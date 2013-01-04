//
//  SlideMenuViewController.m
//  VicsMeats
//
//  Created by Toan Quach on 1/2/13.
//  Copyright (c) 2013 iPhoneDev. All rights reserved.
//

#import "SlideMenuViewController.h"

#import "HomeViewController.h"
#import "CookMethodViewController.h"
#import "MFSideMenu.h"

@interface SlideMenuViewController ()

@end

@implementation SlideMenuViewController

@synthesize sideMenu;

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
    // Create list menu item
    listMenuItem = [[NSMutableArray alloc]init];
    
    NSMutableArray *listItem = [[NSMutableArray alloc]initWithObjects:@"WHAT I’VE EATEN",@"My Meat Tray", nil];
    [listMenuItem addObject:listItem];
    
    listItem = [[NSMutableArray alloc]initWithObjects:@"THE BUTCHER SUGGESTS", @"COOK IT PERFECTLY", @"THE MEAT RACK", @"ASK A QUESTION", nil];
    [listMenuItem addObject:listItem];
    
    listItem = [[NSMutableArray alloc]initWithObjects:@"ABOUT", @"SETTINGS", nil];
    [listMenuItem addObject:listItem];
    
    // Create list image name
    listMenuImageName = [[NSMutableArray alloc] init];
    
    listItem = [[NSMutableArray alloc]initWithObjects:@"bg-what-i-eat.png",@"bg-my-meat-tray.png", nil];
    [listMenuImageName addObject:listItem];
    
    listItem = [[NSMutableArray alloc]initWithObjects:@"bg-the-butcher-suggest.png", @"bg-cook-perfectly.png", @"bg-the-meat-rack.png", @"bg-askquestion.png", nil];
    [listMenuImageName addObject:listItem];
    
    listItem = [[NSMutableArray alloc]initWithObjects:@"bg-about.png", @"bg-settings.png", nil];
    [listMenuImageName addObject:listItem];
    
    if (!IS_IPHONE_5)
    {
        CGRect rect = myTableView.frame;
        rect.size.height = 460;
        myTableView.frame = rect;
    }
    
    // Create Header View
    searchBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 271, 48)];
    // Add background View
    searchBgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slidemenu_search_bar"]];
    searchBgImageView.frame = CGRectMake(0, 0, 320, 48);
    searchBgImageView.contentMode = UIViewContentModeScaleToFill;
    [searchBgView addSubview:searchBgImageView];
    
    // Add Search Text Field
    searchTextField = [[UITextField alloc]initWithFrame:CGRectMake(51, 9, 203, 30)];
    searchTextField.borderStyle = UITextBorderStyleNone;
    searchTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [searchTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    searchTextField.userInteractionEnabled = NO;
    [searchBgView addSubview:searchTextField];
    
    myTableView.tableHeaderView = searchBgView;
    [myTableView reloadData];
}

#pragma mark - UITable Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == kSlideMenu_MyProfile_Tag)
    {
        return @"MY PROFILE";
    }
    else if(section == kSlideMenu_MainMenu_Tag)
    {
        return @"MAIN MENU";
    }
    else
    {
        return @"MORE";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 48;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    [[NSBundle mainBundle] loadNibNamed:@"SlideMenuHeaderView" owner:self options:nil];
    if (section == kSlideMenu_MyProfile_Tag)
    {
        [slideMenuHeader setupViewWithText:[self tableView:tableView titleForHeaderInSection:section]  andImageName:@"bg-my-profile.png"];
    }
    else if(section == kSlideMenu_MainMenu_Tag)
    {
        [slideMenuHeader setupViewWithText:[self tableView:tableView titleForHeaderInSection:section]  andImageName:@"bg-main-menu.png"];
    }
    else
    {
        [slideMenuHeader setupViewWithText:[self tableView:tableView titleForHeaderInSection:section]  andImageName:@"bg-more.png"];
    }
    return slideMenuHeader;
}

// CELL
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[listMenuItem objectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((indexPath.section == 0 && indexPath.row == 1) || (indexPath.section == 1 && indexPath.row == 3))
    {
        return 64;
    }
    else if(indexPath.section == 2 && indexPath.row == 1)
    {
        return 60;
    }
    return 48;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    slideMenuViewCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (slideMenuViewCell == nil)
    {
        [[NSBundle mainBundle] loadNibNamed:@"SlideMenuViewCell" owner:self options:nil];
    }
    
    NSString *menuText = [[listMenuItem objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    NSString *menuImageName = [[listMenuImageName objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    [slideMenuViewCell setupViewWithText:menuText andImageName:menuImageName andIndexPath:indexPath];
    
    return slideMenuViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row == 1)
    {
        NSArray *controllers = self.navigationController.viewControllers;
        CookMethodViewController *viewController = [mainAppDelegate.storyBoard instantiateViewControllerWithIdentifier:@"cookMethodController"];
        controllers = [NSArray arrayWithObjects:[mainAppDelegate.navigationController.viewControllers objectAtIndex:0],viewController, nil];
        
        self.sideMenu.navigationController.viewControllers = controllers;
        [self.sideMenu setMenuState:MFSideMenuStateHidden];
    }
}

@end
