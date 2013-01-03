//
//  AppDelegate.h
//  VicsMeats
//
//  Created by Toan Quach on 12/27/12.
//  Copyright (c) 2012 iPhoneDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MFSideMenu;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    MFSideMenu *sideMenu;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIStoryboard *storyBoard;
@property (strong, nonatomic) UINavigationController *navigationController;

- (MFSideMenu *)sideMenu;
- (void)showSlideMenu;

@end
