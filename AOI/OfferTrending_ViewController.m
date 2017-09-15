//
//  Offer&Trending_ViewController.m
//  AOI
//
//  Created by Tecksky Techonologies on 4/19/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "Offer&Trending_ViewController.h"
#import "Container_Offer_ViewController.h"
@interface Offer_Trending_ViewController ()
{
    NSArray *names;
}
@property (weak, nonatomic) IBOutlet Container_Offer_ViewController *containerview;

@property (nonatomic)NSInteger btntag;

@property (weak, nonatomic) IBOutlet UIScrollView *scrlView_Offer;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl_Offer;

@end

@implementation Offer_Trending_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _scrlView_Offer.pagingEnabled = YES;
    _scrlView_Offer.showsVerticalScrollIndicator = NO;
    _scrlView_Offer.showsHorizontalScrollIndicator = NO;
    _scrlView_Offer.bounces = false;
    
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
   [self Offer];
}
-(void)Offer
{
    
    
    NSArray *dataArray = [NSArray arrayWithObjects:@"2.jpg", @"2.jpg", @"3.jpg", @"1.jpeg", @"2.jpg", @"3.jpg", nil];
    names = @[@"SUV CAR", @"BMW CAR", @"ODI", @"FRARI", @"rer", @"ere"];
    
    NSArray *priceArray = @[@"1.02 CR", @"2CR", @"3CR", @"1CR", @"5CR", @"1CR"];
    
    _pageControl_Offer.numberOfPages = dataArray.count;
    for (int i = 0; i<[dataArray count]; i++)
    {
        CGRect frame;
        frame.origin.x = self.scrlView_Offer.frame.size.width * i;
        frame.origin.y = 0;
        frame.size.width = self.scrlView_Offer.frame.size.width;
        frame.size.height = self.scrlView_Offer.bounds.size.height;
        
        UIView *View = [[UIView alloc] initWithFrame:frame];
        View.layer.borderColor = [[UIColor grayColor] CGColor];
        View.layer.borderWidth = 1.0f;
        
        [_scrlView_Offer addSubview:View];
        
        CGRect imgFrame;
        imgFrame.origin.x = 0;
        imgFrame.origin.y = 0;
        imgFrame.size.width = frame.size.width;
        imgFrame.size.height = frame.size.height-50;
        
        
        NSLog(@"Frame:%@",  NSStringFromCGRect(imgFrame));
        UIImageView *img = [[UIImageView alloc] initWithFrame:imgFrame];
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
    _scrlView_Offer.contentSize = CGSizeMake(_scrlView_Offer.frame.size.width * dataArray.count, _scrlView_Offer.frame.size.height);
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView == _scrlView_Offer)
    {
        CGFloat pageWidth = _scrlView_Offer.frame.size.width;
        int page = floor((_scrlView_Offer.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        _pageControl_Offer.currentPage = page;
        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //  vc = [[UIViewController alloc]init];
    // Make sure your segue name in storyboard is the same as this line
    
    
    if ([[segue identifier] isEqual: @"containerOffer"])
    {
        self.containerview = (Container_Offer_ViewController *)[segue destinationViewController];
    }
}

@end
