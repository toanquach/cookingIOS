//
//  CookMethodViewCell.h
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LBorderView.h"

@interface CookMethodViewCell : UITableViewCell
{
    IBOutlet UIImageView *methodImageView;    
    __weak IBOutlet LBorderView *borderView;
    NSIndexPath *mIndexPath;
}

- (void)setupView:(NSString *)name andIndexPath:(NSIndexPath *)indexPath;

- (IBAction)mainButtonTouchDown:(id)sender;
- (IBAction)mainButtonTouchUp:(id)sender;
- (IBAction)mainButtonDragOutSide:(id)sender;

@end
