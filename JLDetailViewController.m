//
//  JLDetailViewController.m
//  JLAwesomeToolbar
//
//  Created by Jeffrey Linwood on 4/24/14.
//  Copyright (c) 2014 Jeff Linwood. All rights reserved.
//

#import "JLDetailViewController.h"

#import "JLAppNotifications.h"

@interface JLDetailViewController ()

@end

@implementation JLDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)hideTabs:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:JLTabHideTabsNotification object:nil];
    self.hideTabsButton.enabled = NO;
    self.showTabsButton.enabled = YES;
}

- (IBAction)showTabs:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:JLTabShowTabsNotification object:nil];
    self.hideTabsButton.enabled = YES;
    self.showTabsButton.enabled = NO;
}
@end
