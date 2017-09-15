//
//  NewsViewController.m
//  AOI
//
//  Created by Tecksky Techonologies on 4/22/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import <VHBoomMenuButton.h>
#import "VHBoomDelegate.h"
#import "NewsViewController.h"
#import "AppMethod.h"
@interface NewsViewController ()<VHBoomDelegate>
@property (weak, nonatomic) IBOutlet UIView *boomView;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
      [self loadViewData];
    
}
- (void)loadViewData
{
    //        CGRect screenFrame         = [[UIScreen mainScreen] bounds];
    //        self.view                  = [[UIView alloc] initWithFrame:screenFrame];
    //        self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    //         // 1. Put bmb in your VC
    //    CGFloat bmbRadius = 60;
    
    VHBoomMenuButton *bmb      = [[VHBoomMenuButton alloc] initWithFrame:CGRectMake(0,0,
                                                                                    _boomView.frame.size.width,
                                                                                    _boomView.frame.size.height)];
    bmb.buttonNormalColor = [UIColor colorWithRed:167.0f/255.0f green:40.0f/255.0f blue:31.0f/255.0f alpha:1.0f];
    bmb.layer.backgroundColor = [[UIColor clearColor] CGColor];
    bmb.boomEnum = VHBoomParabola_3;
    bmb.buttonEnum = VHButtonTextOutsideCircle;
    bmb.boomDelegate  = self;
    bmb.dimColor = [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:0.8];
    
    // 3. Tell BMB how to place the button on itself(before BOOM)
    bmb.piecePlaceEnum         = VHButtonHam;
    
    // 4. Tell BMB how to place the button on screen(after BOOM)
    bmb.buttonPlaceEnum        = VHButtonPlace_Vertical;
    bmb.lastHamButtonMarginMoreTop = YES;
    bmb.lastHamButtonTopMargin     = 50;
    
    //UIColor *boomNormalColor = [UIColor colorWithRed:31.0f/255.0f green:151.0f/255.0f blue:227.0f/255.0f alpha:1.0];
    
    
    // 5. Add some buttons by builder
    [bmb addHamButtonBuilderBlock:^(VHHamButtonBuilder *builder) {
        builder.imageNormal        = @"icon_menu_auth_dealer.png";
        builder.titleContent = @"Authorize Dealer";
        builder.titleFont = [UIFont fontWithName:@"OpenSans" size:12.0];
        builder.buttonNormalColor  = [AppMethod randomColor];
        builder.buttonPressedColor = [AppMethod randomColor];;
    }];
    
   [bmb addHamButtonBuilderBlock:^(VHHamButtonBuilder *builder) {
        builder.imageNormal        = @"icon_menu_brands.png";
        builder.titleContent = @"Brands";
        builder.titleFont = [UIFont fontWithName:@"OpenSans" size:12.0];
        builder.buttonNormalColor  = [AppMethod randomColor];;
        builder.buttonPressedColor = [AppMethod randomColor];;
    }];
    
    [bmb addHamButtonBuilderBlock:^(VHHamButtonBuilder *builder){
        builder.imageNormal        = @"icon_menu_services.png";
        builder.titleContent = @"Services";
        builder.titleFont = [UIFont fontWithName:@"OpenSans" size:12.0];
        builder.buttonNormalColor  = [AppMethod randomColor];;
        builder.buttonPressedColor = [AppMethod randomColor];;
    }];
    
//    [bmb addTextOutsideCircleButtonBuilderBlock:^(VHTextOutsideCircleButtonBuilder *builder) {
//        builder.imageNormal        = @"icon_menu_auto_business.png";
//        builder.textContent = @"News";
//        builder.font = [UIFont fontWithName:@"OpenSans" size:12.0];
//        builder.buttonNormalColor  = boomNormalColor;
//        builder.buttonPressedColor = boomNormalColor;
//    }];
//    
//    [bmb addTextOutsideCircleButtonBuilderBlock:^(VHTextOutsideCircleButtonBuilder *builder) {
//        builder.imageNormal        = @"icon_menu_compare.png";
//        builder.textContent = @"Compare";
//        builder.font = [UIFont fontWithName:@"OpenSans" size:12.0];
//        builder.buttonNormalColor  = boomNormalColor;
//        builder.buttonPressedColor = boomNormalColor;
//    }];
//    
//    [bmb addTextOutsideCircleButtonBuilderBlock:^(VHTextOutsideCircleButtonBuilder *builder) {
//        builder.imageNormal        = @"icon_menu_used.png";
//        builder.textContent = @"Used";
//        builder.font = [UIFont fontWithName:@"OpenSans" size:12.0];
//        builder.buttonNormalColor  = boomNormalColor;
//        builder.buttonPressedColor = boomNormalColor;
//    }];
//    
//    
//    [bmb addTextOutsideCircleButtonBuilderBlock:^(VHTextOutsideCircleButtonBuilder *builder) {
//        builder.imageNormal        = @"icon_menu_auto_service.png";
//        builder.textContent = @"Auto Service";
//        builder.font = [UIFont fontWithName:@"OpenSans" size:12.0];
//        builder.buttonNormalColor  = boomNormalColor;
//        builder.buttonPressedColor = boomNormalColor;
//        
//    }];
//    
//    
//    [bmb addTextOutsideCircleButtonBuilderBlock:^(VHTextOutsideCircleButtonBuilder *builder) {
//        builder.imageNormal        = @"icon_menu_new.png";
//        builder.textContent = @"New";
//        builder.font = [UIFont fontWithName:@"OpenSans" size:12.0];
//        builder.buttonNormalColor  = boomNormalColor;
//        builder.buttonPressedColor = boomNormalColor;
//        
//    }];
//    
//    [bmb addTextOutsideCircleButtonBuilderBlock:^(VHTextOutsideCircleButtonBuilder *builder) {
//        builder.imageNormal        = @"icon_menu_workshop.png";
//        builder.textContent = @"Workshop";
//        builder.font = [UIFont fontWithName:@"OpenSans" size:12.0];
//        builder.lines = 2;
//        builder.buttonNormalColor  = boomNormalColor;
//        builder.buttonPressedColor = boomNormalColor;
//        
//    }];
    
    
    [_boomView addSubview:bmb];
}
#pragma mark - Delegates from BMB

- (void)onBoomClicked:(int)index
{
    
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"index%d",index);
//    if (index == 0)
//    {
//        NSLog(@"0");
//        [self.containerview segueIdentifierReceivedFromParent:@"CompareCar"];
//    }
//    else if (index == 1)
//    {
//        [self.containerview segueIdentifierReceivedFromParent:@"CompareCar"];
//        NSLog(@"1");
//    }
//    
//    else if (index == 2)
//    {
//        [self.containerview segueIdentifierReceivedFromParent:@"CompareCar"];
//        NSLog(@"2");
//    }
//    else if (index == 3)
//    {
//        NSLog(@"3");
//        
//        NewsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsViewController"];
//        [self.navigationController pushViewController:vc animated:YES];
//        // [self.containerview segueIdentifierReceivedFromParent:@"News"];
//    }
//    
//    else if (index == 4)
//    {
//        NSLog(@"compare");
//        
//        [self setTitle:@"Compare"];
//        [self.containerview segueIdentifierReceivedFromParent:@"CompareCar"];
//    }
//    
//    else if (index == 5)
//    {
//        NSLog(@"5");
//        [self.containerview segueIdentifierReceivedFromParent:@"CompareCar"];
//    }
//    
//    else if (index == 6)
//    {
//        NSLog(@"6");
//        [self.containerview segueIdentifierReceivedFromParent:@"CompareCar"];
//    }
//    else if (index == 7)
//    {
//        NSLog(@"7");
//        [self.containerview segueIdentifierReceivedFromParent:@"CompareCar"];
//    }
//    
//    else if (index == 8)
//    {
//        NSLog(@"8");
//        [self.containerview segueIdentifierReceivedFromParent:@"CompareCar"];
//    }
//    else if (index == 9)
//    {
//        NSLog(@"9");
//        [self.containerview segueIdentifierReceivedFromParent:@"CompareCar"];
//    }
    
}


@end
