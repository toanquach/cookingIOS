//
//  CookMethodViewController.h
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CookMethodViewCell.h"

@interface CookMethodViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    __weak IBOutlet CookMethodViewCell *cookMethodViewCell;
    IBOutlet UITableView *myTableView;
    IBOutlet UIImageView *backgroundImageView;
    
    NSMutableArray *listMethod;
}

- (void)setupView;

- (IBAction)backButtonTouchUp:(id)sender;
- (IBAction)infosButtonTouchUp:(id)sender;
@end
