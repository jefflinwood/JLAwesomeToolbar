//
//  JLDetailViewController.h
//  JLAwesomeToolbar
//
//  Created by Jeffrey Linwood on 4/24/14.
//  Copyright (c) 2014 Jeff Linwood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *hideTabsButton;
@property (strong, nonatomic) IBOutlet UIButton *showTabsButton;

- (IBAction)hideTabs:(id)sender;
- (IBAction)showTabs:(id)sender;
@end
