//
//  LBViewController.m
//  animmenu
//
//  Created by saifuddin on 24/9/13.
//  Copyright (c) 2013 saifuddin. All rights reserved.
//

#import "LBViewController.h"
#import "UIImage+StackBlur.h"

@interface LBViewController ()
@property (nonatomic, strong) UIImageView *blurView;
- (void)callMenu;
@end

@implementation LBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"test.png"]];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor whiteColor];

    [btn addTarget:self action:@selector(callMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)callMenu
{
    UIGraphicsBeginImageContextWithOptions(self.view.window.bounds.size, NO, [UIScreen mainScreen].scale);
    [self.view.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    self.blurView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    _blurView.alpha = 0;
    _blurView.image = [image stackBlur:30];
    [self.view addSubview:_blurView];

    LBMenuView *v = [[LBMenuView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height + 20)];
    v.delegate = self;
    v.backgroundColor = [UIColor clearColor];

    [UIView animateWithDuration:0.2
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
