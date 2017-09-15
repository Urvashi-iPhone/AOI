//
//  CompareCar_ViewController.m
//  AOI
//
//  Created by Tecksky Techonologies on 4/10/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "CompareCar_ViewController.h"
#import "LoginViewController.h"
#import "SignUpViewController.h"
#import <MaterialControls/MDTabBarViewController.h>

#import "OfferTrending_ViewController.h"
@interface CompareCar_ViewController ()<UIScrollViewDelegate,MDTabBarViewControllerDelegate>
{
    NSArray *names;
  
//     MDTabBarViewController *tabBarViewController;
}
@property (weak, nonatomic) IBOutlet MDTabBar *tabBarView;
@property (weak, nonatomic) IBOutlet UIScrollView *MainScrlView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrlView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrlView_PopularCar;
@property (weak, nonatomic) IBOutlet UIScrollView *scrlView_service;


@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl_popular;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl_service;

@end

@implementation CompareCar_ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
        [self.navigationController.view removeGestureRecognizer:self.navigationController.interactivePopGestureRecognizer];
    
    CGRect contentRect = CGRectZero;
    for (UIView *view in self.MainScrlView.subviews)
    {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    self.MainScrlView.contentSize = contentRect.size;                                                                                                                  
[_MainScrlView setAutoresizesSubviews:NO];
    
    [self AllScrollView];
    
    
    [_tabBarView setItems:@[ @"NEW CAR", @"USED CAR",@"AUTO SERVICE",@"AUTO BUSINESS"]];
    _tabBarView.delegate = self;
    _tabBarView.selectedIndex = 1;
    _tabBarView.textColor = [UIColor colorWithRed:56.0f/255.0f green:147.0f/255.0f blue:224.0f/255.0f alpha:1.0];
    
    _tabBarView.backgroundColor = [UIColor whiteColor];
    _tabBarView.indicatorColor = [UIColor colorWithRed:56.0f/255.0f green:147.0f/255.0f blue:224.0f/255.0f alpha:1.0];
     _tabBarView.textFont = [UIFont fontWithName:@"OpenSans" size:15];
    
    
//    
//    
//    [tabBarViewController setItems:names];
//    
//    [self addChildViewController:tabBarViewController];
//    [self.view addSubview:tabBarViewController.view];
//    [tabBarViewController didMoveToParentViewController:self];
//    UIView *controllerView = tabBarViewController.view;
//    id<UILayoutSupport> rootTopLayoutGuide = self.topLayoutGuide;
//    id<UILayoutSupport> rootBottomLayoutGuide = self.bottomLayoutGuide;
    
//    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(
//                                                                   rootTopLayoutGuide, rootBottomLayoutGuide, controllerView);
//    
//    [self.view
//     addConstraints:[NSLayoutConstraint
//                     constraintsWithVisualFormat:@"V:[rootTopLayoutGuide]["
//                     @"controllerView][" @"rootBottomLayoutGuide]"
//                     options:0
//                     metrics:nil
//                     views:viewsDictionary]];
//    [self.view
//     addConstraints:[NSLayoutConstraint
//                     constraintsWithVisualFormat:@"H:|[controllerView]|"
//                     options:0
//                     metrics:nil
//                     views:viewsDictionary]];
    
}

//- (UIViewController *)tabBarViewController:
//(MDTabBarViewController *)viewController
//                     viewControllerAtIndex:(NSUInteger)index {
//    if (index == 0)
//    {
//        LoginViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
//        [self.navigationController pushViewController:controller animated:YES];
//        NSLog(@"%d",index);
//        return controller;
//    }
//    else
//    {
//        LoginViewController *controller1 = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
//        [self.navigationController pushViewController:controller1 animated:YES];
//        NSLog(@"%d",index);
//        return controller1;
//        
//    }
//}
//
//- (void)tabBarViewController:(MDTabBarViewController *)viewController
//              didMoveToIndex:(NSUInteger)index {
//}


-(void)AllScrollView
{
    
    _scrlView.pagingEnabled = YES;
    _scrlView.showsVerticalScrollIndicator = NO;
    _scrlView.showsHorizontalScrollIndicator = NO;
    _scrlView.bounces = false;
    
    _scrlView_PopularCar.pagingEnabled = YES;
    _scrlView_PopularCar.showsVerticalScrollIndicator = NO;
    _scrlView_PopularCar.showsHorizontalScrollIndicator = NO;
    _scrlView_PopularCar.bounces = false;
    
    _scrlView_service.pagingEnabled = YES;
    _scrlView_service.showsVerticalScrollIndicator = NO;
    _scrlView_service.showsHorizontalScrollIndicator = NO;
    _scrlView_service.bounces = false;
    
   


}


- (void)tabBar:(MDTabBar *)tabBar
didChangeSelectedIndex:(NSUInteger)selectedIndex
{
    if (selectedIndex == 0)
    {
        NSLog(@"1st");
        [self.container segueIdentifierReceivedFromParentOffer:@"Offer"];
    }
    else if (selectedIndex == 1)
    {
    [self.container segueIdentifierReceivedFromParentOffer:@"Offer"];
    }
    else  if (selectedIndex == 2)
    {
        NSLog(@"2nd");
        [self.container segueIdentifierReceivedFromParentOffer:@"Offer"];
    }
    else  if (selectedIndex == 3)
    {
        NSLog(@"2nd");
        [self.container segueIdentifierReceivedFromParentOffer:@"Offer"];
    }

 

}
-(void)viewDidAppear:(BOOL)animated
{
    [self Featured_Articles];
    [self Popular_Cars];
    [self Our_Service];
    
}
-(void)Featured_Articles
{
    NSLog(@"Frame:%@",  NSStringFromCGRect(_scrlView.frame));
    
    NSArray *dataArray = [NSArray arrayWithObjects:@"1.jpeg", @"2.jpg", @"3.jpg", @"1.jpeg", @"2.jpg", @"3.jpg", nil];
    names = @[@"SUV CAR", @"BMW CAR", @"ODI", @"FRARI", @"rer", @"ere"];
    
    NSArray *priceArray = @[@"1.02 CR", @"2CR", @"3CR", @"1CR", @"5CR", @"1CR"];
    
    _pageControl.numberOfPages = dataArray.count;
    for (int i = 0; i<[dataArray count]; i++)
    {
        CGRect frame;
        frame.origin.x = self.scrlView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size.width = self.scrlView.frame.size.width-2;
        frame.size.height = self.scrlView.bounds.size.height;
        
        UIView *View = [[UIView alloc] initWithFrame:frame];
        View.layer.borderColor = [[UIColor grayColor] CGColor];
        View.layer.borderWidth = 1.0f;
        
        [_scrlView addSubview:View];

        CGRect imgFrame;
        imgFrame.origin.x = 0;
        imgFrame.origin.y = 0;
        imgFrame.size.width = frame.size.width;
        imgFrame.size.height = frame.size.height-50;
        
        
        NSLog(@"Frame:%@",  NSStringFromCGRect(imgFrame));
        UIImageView *img = [[UIImageView alloc] initWithFrame:imgFrame];
//        img.layer.borderColor = [[UIColor grayColor] CGColor];
//        img.layer.borderWidth = 1.0f;
        
        img.contentMode = UIViewContentModeScaleToFill;
        img.image = [UIImage imageNamed:[dataArray objectAtIndex:i]];
        [View addSubview:img];
        
        CGRect viewFrame;
        viewFrame.origin.x = 0;
        viewFrame.origin.y = imgFrame.size.height;
        viewFrame.size.width = frame.size.width;
        viewFrame.size.height = 50;
        
        UIView *viewData = [[UIView alloc] initWithFrame:viewFrame];
        viewData.layer.backgroundColor = [[UIColor colorWithRed:56.0f/255.0f green:147.0f/255.0f blue:224.0f/255.0f alpha:1.0] CGColor];
        
//        viewData.layer.borderColor = [[UIColor grayColor] CGColor];
//        viewData.layer.borderWidth = 1.0f;

        
        [View addSubview:viewData];
        
        CGRect lblFrame;
        lblFrame.origin.x = 10;
        lblFrame.origin.y = 4;
        lblFrame.size.width = viewFrame.size.width;
        lblFrame.size.height = viewFrame.size.height-30;
        
        UILabel *Name = [[UILabel alloc] initWithFrame:lblFrame];
        Name.text = [names objectAtIndex:i];
        Name.font = [UIFont fontWithName:@"OpenSans-Bold" size:15];
        Name.textColor = [UIColor whiteColor];
        [viewData addSubview:Name];
        
        CGRect priceFrame;
        priceFrame.origin.x = 10;
        priceFrame.origin.y = lblFrame.size.height+8;
        priceFrame.size.width = lblFrame.size.width;
        priceFrame.size.height = 20;
        
        
        UILabel *Price = [[UILabel alloc] initWithFrame:priceFrame];
        Price.text = [priceArray objectAtIndex:i];
        Price.textColor = [UIColor whiteColor];
        Price.font = [UIFont fontWithName:@"OpenSans" size:15];
        [viewData addSubview:Price];
        
    }
    _scrlView.contentSize = CGSizeMake(_scrlView.frame.size.width * dataArray.count, _scrlView.frame.size.height);
 
}

-(void)Popular_Cars
{
    NSLog(@"Frame:%@",  NSStringFromCGRect(_scrlView_PopularCar.frame));
    
    NSArray *dataArray = [NSArray arrayWithObjects:@"1.jpeg", @"2.jpg", @"3.jpg", @"1.jpeg", @"2.jpg", @"3.jpg", nil];
    names = @[@"SUV", @"BMW", @"ODI", @"FRARI", @"rer", @"ere"];
    
    NSArray *priceArray = @[@"1CR", @"2CR", @"3CR", @"1CR", @"5CR", @"1CR"];
    
    _pageControl_popular.numberOfPages = dataArray.count;
    for (int i = 0; i<[dataArray count]; i++)
    {
        CGRect frame;
        frame.origin.x = self.scrlView_PopularCar.frame.size.width * i;
        frame.origin.y = 0;
        frame.size.width = self.scrlView_PopularCar.frame.size.width-2;
        frame.size.height = self.scrlView_PopularCar.bounds.size.height;
        
        UIView *View = [[UIView alloc] initWithFrame:frame];
        View.layer.borderColor = [[UIColor grayColor] CGColor];
        View.layer.borderWidth = 1.0f;
        
        [_scrlView_PopularCar addSubview:View];
        
        CGRect imgFrame;
        imgFrame.origin.x = 0;
        imgFrame.origin.y = 0;
        imgFrame.size.width = frame.size.width;
        imgFrame.size.height = frame.size.height-50;
        
//        CGRect frame;
//        frame.origin.x = self.scrlView_PopularCar.frame.size.width * i;
//        frame.origin.y = 0;
//        frame.size.width = self.scrlView_PopularCar.frame.size.width;
//        frame.size.height = self.scrlView_PopularCar.bounds.size.height-50;
        
        
        NSLog(@"Frame:%@",  NSStringFromCGRect(imgFrame));
        UIImageView *img = [[UIImageView alloc] initWithFrame:imgFrame];
        img.contentMode = UIViewContentModeScaleToFill;
        img.image = [UIImage imageNamed:[dataArray objectAtIndex:i]];
        [View addSubview:img];
        
        CGRect viewFrame;
        viewFrame.origin.x = _scrlView_PopularCar.frame.size.width * i;
        viewFrame.origin.y = imgFrame.size.height;
        viewFrame.size.width = frame.size.width;
        viewFrame.size.height = 50;
        
        UIView *viewData = [[UIView alloc] initWithFrame:viewFrame];
        viewData.layer.backgroundColor = [[UIColor colorWithRed:56.0f/255.0f green:147.0f/255.0f blue:224.0f/255.0f alpha:1.0] CGColor];
        [View addSubview:viewData];
        
        CGRect lblFrame;
        lblFrame.origin.x = 10;
        lblFrame.origin.y = 0;
        lblFrame.size.width = viewFrame.size.width;
        lblFrame.size.height = viewFrame.size.height-30;
        
        UILabel *Name = [[UILabel alloc] initWithFrame:lblFrame];
        Name.text = [names objectAtIndex:i];
        Name.textColor = [UIColor whiteColor];
        Name.font = [UIFont fontWithName:@"OpenSans-Bold" size:15];
        [viewData addSubview:Name];
        
        CGRect priceFrame;
        priceFrame.origin.x = 10;
        priceFrame.origin.y = lblFrame.size.height+8;
        priceFrame.size.width = lblFrame.size.width;
        priceFrame.size.height = 20;
        
        
        UILabel *Price = [[UILabel alloc] initWithFrame:priceFrame];
        Price.text = [priceArray objectAtIndex:i];
        Price.textColor = [UIColor whiteColor];
         Price.font = [UIFont fontWithName:@"OpenSans" size:15];
        [viewData addSubview:Price];
        
    }
    _scrlView_PopularCar.contentSize = CGSizeMake(_scrlView_PopularCar.frame.size.width * dataArray.count, _scrlView_PopularCar.frame.size.height);
    
}

-(void)Our_Service
{
    
    
    NSArray *dataArray = [NSArray arrayWithObjects:@"4.png", @"2.jpg", @"4.png", nil];
    
    _pageControl_service.numberOfPages = dataArray.count;
    for (int i = 0; i<[dataArray count]; i++)
    {
        CGRect frame;
        frame.origin.x = self.scrlView_service.frame.size.width * i;
        frame.origin.y = 0;
        frame.size.width = self.scrlView_service.frame.size.width-2;
        frame.size.height = self.scrlView_service.bounds.size.height;
        
        UIView *View = [[UIView alloc] initWithFrame:frame];
        View.layer.borderColor = [[UIColor grayColor] CGColor];
        View.layer.borderWidth = 1.0f;
        
        [_scrlView_service addSubview:View];
        
        CGRect imgFrame;
        imgFrame.origin.x = 0;
        imgFrame.origin.y = 0;
        imgFrame.size.width = frame.size.width;
        imgFrame.size.height = frame.size.height-100;
        
        
        NSLog(@"Frame:%@",  NSStringFromCGRect(imgFrame));
        UIImageView *img = [[UIImageView alloc] initWithFrame:imgFrame];
        //        img.layer.borderColor = [[UIColor grayColor] CGColor];
        //        img.layer.borderWidth = 1.0f;
        
        img.contentMode = UIViewContentModeScaleToFill;
        img.image = [UIImage imageNamed:[dataArray objectAtIndex:i]];
        [View addSubview:img];
        
        CGRect viewFrame;
        viewFrame.origin.x = 0;
        viewFrame.origin.y = imgFrame.size.height;
        viewFrame.size.width = frame.size.width;
        viewFrame.size.height = 100;
        
        UIView *viewData = [[UIView alloc] initWithFrame:viewFrame];
        viewData.layer.backgroundColor = [[UIColor colorWithRed:56.0f/255.0f green:147.0f/255.0f blue:224.0f/255.0f alpha:1.0] CGColor];
        
        //        viewData.layer.borderColor = [[UIColor grayColor] CGColor];
        //        viewData.layer.borderWidth = 1.0f;
        
        
        [View addSubview:viewData];
        
        
        CGRect lblFrame;
        lblFrame.origin.x = 0;
        lblFrame.origin.y = 5;
        lblFrame.size.width = viewFrame.size.width;
        lblFrame.size.height = 30;
        
        UILabel *Name = [[UILabel alloc] initWithFrame:lblFrame];
        Name.text = @"SERVICE YOUR CAR";
        Name.textAlignment = NSTextAlignmentCenter;
        Name.textColor = [UIColor whiteColor];
        Name.font = [UIFont fontWithName:@"OpenSans-Bold" size:20];
        [viewData addSubview:Name];

        
        CGRect ReadMoreFrame;
        ReadMoreFrame.origin.x = 8;
        ReadMoreFrame.origin.y = lblFrame.size.height+10;
        ReadMoreFrame.size.width = viewFrame.size.width/2-8;
        ReadMoreFrame.size.height = viewFrame.size.height-50;
        
        UIButton *ReadMore = [[UIButton alloc] initWithFrame:ReadMoreFrame];
        [ReadMore setTitle:@"READ MORE" forState:UIControlStateNormal];
        ReadMore.font = [UIFont fontWithName:@"OpenSans-Bold" size:20];
        [ReadMore setTitleColor:[UIColor colorWithRed:56.0f/255.0f green:147.0f/255.0f blue:224.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
        ReadMore.backgroundColor = [UIColor whiteColor];
        
        
        ReadMore.layer.masksToBounds = false;
        ReadMore.layer.shadowRadius = 3.0;
        ReadMore.layer.shadowColor = [[UIColor blackColor] CGColor];
        ReadMore.layer.shadowOffset = CGSizeMake(1.0, 1.0);
        ReadMore.layer.shadowOpacity = 1.0;
        
        [ReadMore addTarget:self action:@selector(myReadMore:) forControlEvents:UIControlEventTouchUpInside];
        [viewData addSubview:ReadMore];
        
        CGRect CarServiceFrame;
        CarServiceFrame.origin.x = viewFrame.size.width/2+8;
        CarServiceFrame.origin.y = lblFrame.size.height+10;
        CarServiceFrame.size.width = ReadMoreFrame.size.width-8;
        CarServiceFrame.size.height = viewFrame.size.height-50;
        
        
        UIButton *CarService = [[UIButton alloc] initWithFrame:CarServiceFrame];
        [CarService setTitle:@"CAR SERVICE" forState:UIControlStateNormal];
        CarService.titleLabel.textColor = [UIColor whiteColor];
        CarService.backgroundColor = [UIColor redColor];
        [CarService addTarget:self action:@selector(myCarService:) forControlEvents:UIControlEventTouchUpInside];
        
        CarService.layer.masksToBounds = false;
        CarService.layer.shadowRadius = 3.0;
        CarService.layer.shadowColor = [[UIColor blackColor] CGColor];
        CarService.layer.shadowOffset = CGSizeMake(1.0, 1.0);
        CarService.layer.shadowOpacity = 1.0;
        
        CarService.font = [UIFont fontWithName:@"OpenSans-Bold" size:20];
        [viewData addSubview:CarService];
        
    }
    _scrlView_service.contentSize = CGSizeMake(_scrlView_service.frame.size.width * dataArray.count, _scrlView_service.frame.size.height);
    
}
- (IBAction)myReadMore:(id)sender
{
    NSLog(@"Read more");
}
- (IBAction)myCarService:(id)sender
{
    NSLog(@"myCarService");
}




-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _scrlView) {
        CGFloat pageWidth = _scrlView.frame.size.width;
        int page = floor((_scrlView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        _pageControl.currentPage = page;

    }
    else if (scrollView == _scrlView_PopularCar)
    {
        CGFloat pageWidth = _scrlView_PopularCar.frame.size.width;
        int page = floor((_scrlView_PopularCar.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        _pageControl_popular.currentPage = page;

    }
    else if (scrollView == _scrlView_service)
    {
        CGFloat pageWidth = _scrlView_service.frame.size.width;
        int page = floor((_scrlView_service.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        _pageControl_service.currentPage = page;
        
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //  vc = [[UIViewController alloc]init];
    // Make sure your segue name in storyboard is the same as this line
    
    
    if ([[segue identifier] isEqual: @"containerOffer"]){
        self.container = (Container_Offer_ViewController *)[segue destinationViewController];
    }
}

@end
