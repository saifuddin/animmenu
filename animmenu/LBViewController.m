//
//  LBViewController.m
//  animmenu
//
//  Created by saifuddin on 24/9/13.
//  Copyright (c) 2013 saifuddin. All rights reserved.
//

#import "LBViewController.h"
#import "UIImage+StackBlur.h"

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
#define iOS7 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
#define isWidescreen (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)568) < DBL_EPSILON)

@interface LBViewController ()
@property (nonatomic, strong) UIImageView *blurView;
- (void)callMenu;
@end

@implementation LBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(iOS7) self.edgesForExtendedLayout = UIRectEdgeNone;
    UIImage *img = (isWidescreen) ? [UIImage imageNamed:@"test.png"] : [UIImage imageNamed:@"test2.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:img];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor whiteColor];

    [btn addTarget:self action:@selector(callMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)callMenu
{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *data = UIImagePNGRepresentation(image);
    UIImage *screenShot = [UIImage imageWithData:data];

    self.blurView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    _blurView.alpha = 1;
    _blurView.image = [screenShot stackBlur:30];
    [self.view addSubview:_blurView];

    LBMenuView *v = [[LBMenuView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    v.delegate = self;
    v.backgroundColor = [UIColor clearColor];

    [UIView animateWithDuration:0.4
                     animations:^{
                         _blurView.alpha = 1;
                         [self.view addSubview:v];
                     }
                     completion:^(BOOL f){
                     }];
}

- (void)didTappedAtButtonIndex:(btnMenu)index
{
    [UIView animateWithDuration:0.3
                     animations:^{
                         _blurView.alpha = 0;
                     }
                     completion:^(BOOL f){
                         [_blurView removeFromSuperview];
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
