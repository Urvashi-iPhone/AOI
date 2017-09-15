//
//  MainViewController.h
//  Just Reminder
//
//  Created by Tecksky Techonologies on 12/14/16.
//  Copyright © 2016 Softranz Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "ContainerViewController.h"
@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menubtn;
@property (weak, nonatomic) IBOutlet ContainerViewController *containerview;
@property (nonatomic)NSInteger btntag;
- (IBAction)showMenu:(id)sender;
@end
