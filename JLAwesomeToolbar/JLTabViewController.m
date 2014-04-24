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
@property (nonatomic, assign) CGPoint originalYellowTabCenter;
@property (nonatomic, assign) CGPoint originalPinkTabCenter;
@property (nonatomic, assign) CGPoint originalBlueTabCenter;
@property (nonatomic, assign) CGPoint originalGreenTabCenter;
@property (nonatomic, assign) CGRect originalRedTabFrame;

@end

@implementation JLTabViewController

- (void) hideTabsAnimated:(NSNotification*)notification {
    [UIView animateWithDuration:0.75
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            self.yellowTabView.center = CGPointMake(350, -30);
                            self.pinkTabView.center = CGPointMake(350, 100);
                            self.blueTabView.center = CGPointMake(-30, 100);
                            self.greenTabView.center = CGPointMake(-30, -30);
     } completion:^(BOOL finished) {
         [UIView animateWithDuration:0.75
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
    self.yellowTabView.center = CGPointMake(self.yellowTabView.center.x, self.yellowTabView.center.y - 100);
    self.pinkTabView.center = CGPointMake(self.pinkTabView.center.x, self.pinkTabView.center.y - 100);
    self.blueTabView.center = CGPointMake(self.blueTabView.center.x, self.blueTabView.center.y - 100);
    self.greenTabView.center = CGPointMake(self.greenTabView.center.x, self.greenTabView.center.y - 100);
    self.redTabView.center = CGPointMake(self.redTabView.center.x, -30);
    self.redTabView.alpha = 1.0;
    [UIView animateWithDuration:0.75
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            self.yellowTabView.center = self.originalYellowTabCenter;
                            self.pinkTabView.center = self.originalPinkTabCenter;
                            self.redTabView.frame = self.originalRedTabFrame;
                            self.blueTabView.center = self.originalBlueTabCenter;
                            self.greenTabView.center = self.originalGreenTabCenter;
                        } completion:^(BOOL finished) {
                            
                        }];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideTabsAnimated:) name:JLTabHideTabsNotification object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTabsAnimated:) name:JLTabShowTabsNotification object:nil];
   }

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.originalYellowTabCenter = self.yellowTabView.center;
    self.originalRedTabFrame = self.redTabView.frame;
    self.originalBlueTabCenter = self.blueTabView.center;
    self.originalGreenTabCenter = self.greenTabView.center;
    self.originalPinkTabCenter = self.pinkTabView.center;

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
