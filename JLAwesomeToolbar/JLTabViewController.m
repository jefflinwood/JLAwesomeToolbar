//
//  JLTabViewController.m
//  JLAwesomeToolbar
//
//  Created by Jeffrey Linwood on 4/24/14.
//  Copyright (c) 2014 Jeff Linwood. All rights reserved.
//

#import "JLTabViewController.h"

#import "JLAppNotifications.h"

@interface JLTabViewController ()

@end

@implementation JLTabViewController

- (void) hideTabsAnimated:(NSNotification*)notification {
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            self.yellowTabView.center = CGPointMake(350, -30);
                            self.pinkTabView.center = CGPointMake(350, 100);
                            self.blueTabView.center = CGPointMake(-30, 100);
                            self.greenTabView.center = CGPointMake(-30, -30);
     } completion:^(BOOL finished) {
         [UIView animateWithDuration:1.0
                               delay:0.0
                             options:UIViewAnimationOptionCurveEaseInOut animations:^{
                                 CGFloat newX = self.view.center.x - self.redTabView.frame.size.width;
                                 CGFloat newY = self.view.center.y - self.redTabView.frame.size.height;
                                 CGFloat newWidth = self.redTabView.frame.size.width * 2;
                                 CGFloat newHeight = self.redTabView.frame.size.height * 2;
                                 self.redTabView.frame = CGRectMake(newX, newY, newWidth, newHeight);
                             } completion:^(BOOL finished) {
                                 [UIView animateWithDuration:0.5 animations:^{
                                     self.redTabView.alpha = 0.0;
                                 }];
                             }];
     }];
}

- (void) showTabsAnimated:(NSNotification*)notification {
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideTabsAnimated:) name:JLTabHideTabsNotification object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTabsAnimated:) name:JLTabShowTabsNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
