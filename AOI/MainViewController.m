//
//  MainViewController.m
//  Just Reminder
//
//  Created by Tecksky Techonologies on 12/14/16.
//  Copyright © 2016 Softranz Technologies. All rights reserved.
//

#import "MainViewController.h"
#import "ContainerViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_btntag == 1)
    {
        [self.containerview segueIdentifierReceivedFromParent:@"buttonOne"];
    }
    if (_btntag == 2)
    {
        [self.containerview segueIdentifierReceivedFromParent:@"buttonTwo"];
    }
      [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
 
}
- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController panGestureRecognized:sender];
}

- (IBAction)showMenu
{
   
     [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //  vc = [[UIViewController alloc]init];
    // Make sure your segue name in storyboard is the same as this line
    
    
    if ([[segue identifier] isEqual: @"container"])
    {
        self.containerview = (ContainerViewController *)[segue destinationViewController];
    }
}
@end
