//
//  SlideMenuViewController.h
//  VicsMeats
//
//  Created by Toan Quach on 1/2/13.
//  Copyright (c) 2013 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MFSideMenu.h"
#import "SlideMenuHeaderView.h"
#import "SlideMenuViewCell.h"

@interface SlideMenuViewController : UIViewController<UITableViewDataSource , UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    __weak IBOutlet SlideMenuHeaderView *slideMenuHeader;
    __weak IBOutlet SlideMenuViewCell *slideMenuViewCell;
    
    NSMutableArray *listMenuItem;
    NSMutableArray *listMenuImageName;
    UITextField *searchTextField;
    UIImageView *searchBgImageView;
    UIView *searchBgView;
}

@property (nonatomic, assign) MFSideMenu *sideMenu;

- (void)setupView;

@end
