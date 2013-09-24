//
//  LBMenuView.m
//  animmenu
//
//  Created by saifuddin on 24/9/13.
//  Copyright (c) 2013 saifuddin. All rights reserved.
//

#import "LBMenuView.h"

#define is4Inch ([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO

#define BUTTON_WIDTH 73
#define PADDING_X (selfFrame.size.width - (BUTTON_WIDTH*3.0))/4.0
// We define the starting and end position of 3x3 matrix.
// 4inch screen
/* ---- First Row ---- */
// Akhram
#define akhramStartX_4 -BUTTON_WIDTH
#define akhramEndX_4 PADDING_X
#define akhramStartY_4 -BUTTON_WIDTH
#define akhramEndY_4 105
// Manifesto
#define manifestoStartX_4 PADDING_X + BUTTON_WIDTH + PADDING_X
#define manifestoEndX_4 manifestoStartX_4
#define manifestoStartY_4 -BUTTON_WIDTH
#define manifestoEndY_4 akhramEndY_4
// Blog
#define blogStartX_4 selfFrame.size.width
#define blogEndX_4 PADDING_X + BUTTON_WIDTH + PADDING_X + BUTTON_WIDTH + PADDING_X
#define blogStartY_4 -BUTTON_WIDTH
#define blogEndY_4 akhramEndY_4
/* ---- Second Row ---- */
// Diary
#define diaryStartX_4 akhramStartX_4
#define diaryEndX_4 akhramEndX_4
#define diaryStartY_4 235
#define diaryEndY_4 diaryStartY_4
// Berita
#define beritaStartX_4 manifestoEndX_4
#define beritaStartY_4 diaryEndY_4
// Video
#define videoStartX_4 blogStartX_4
#define videoEndX_4 blogEndX_4
#define videoStartY_4 diaryStartY_4
#define videoEndY_4 diaryStartY_4
/* --- Third Row ---- */
// Terkini
#define terkiniStartX manifestoStartX_4
#define terkiniEndX terkiniStartX
#define terkiniStartY_4 selfFrame.size.height
#define terkiniEndY 350

@interface LBMenuView ()
{
    CGRect selfFrame;
}
@property (nonatomic, strong) UIButton *btnAkhram;
@property (nonatomic, strong) UIButton *btnManifesto;
@property (nonatomic, strong) UIButton *btnBlog;
@property (nonatomic, strong) UIButton *btnDiary;
@property (nonatomic, strong) UIButton *btnBerita;
@property (nonatomic, strong) UIButton *btnVideo;
@property (nonatomic, strong) UIButton *btnTerkini;
- (void)didTappedAtButton:(UIButton *)btn;
@end

@implementation LBMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        selfFrame = frame;

        self.btnAkhram = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnAkhram.tag = btnMenuAkhram;
        _btnAkhram.frame = CGRectMake(akhramStartX_4, akhramStartY_4, BUTTON_WIDTH, BUTTON_WIDTH);
        _btnAkhram.backgroundColor = [UIColor redColor];
        [_btnAkhram addTarget:self action:@selector(didTappedAtButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnAkhram];

        self.btnManifesto = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnManifesto.tag = btnMenuManifesto;
        _btnManifesto.frame = CGRectMake(manifestoStartX_4, manifestoStartY_4, BUTTON_WIDTH, BUTTON_WIDTH);
        _btnManifesto.backgroundColor = [UIColor redColor];
        [_btnManifesto addTarget:self action:@selector(didTappedAtButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnManifesto];

        self.btnBlog = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnBlog.tag = btnMenuBlog;
        _btnBlog.frame = CGRectMake(blogStartX_4, blogStartY_4, BUTTON_WIDTH, BUTTON_WIDTH);
        _btnBlog.backgroundColor = [UIColor redColor];
        [_btnBlog addTarget:self action:@selector(didTappedAtButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnBlog];

        self.btnDiary = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnDiary.tag = btnMenuDiary;
        _btnDiary.frame = CGRectMake(diaryStartX_4, diaryStartY_4, BUTTON_WIDTH, BUTTON_WIDTH);
        _btnDiary.backgroundColor = [UIColor redColor];
        [_btnDiary addTarget:self action:@selector(didTappedAtButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnDiary];

        self.btnBerita = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnBerita.tag = btnMenuBerita;
        _btnBerita.frame = CGRectMake(beritaStartX_4, beritaStartY_4, BUTTON_WIDTH, BUTTON_WIDTH);
        _btnBerita.backgroundColor = [UIColor redColor];
        [_btnBerita addTarget:self action:@selector(didTappedAtButton:) forControlEvents:UIControlEventTouchUpInside];
        _btnBerita.alpha = 0;
        [self addSubview:_btnBerita];

        self.btnVideo = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnVideo.tag = btnMenuVideo;
        _btnVideo.frame = CGRectMake(videoStartX_4, videoStartY_4, BUTTON_WIDTH, BUTTON_WIDTH);
        _btnVideo.backgroundColor = [UIColor redColor];
        [_btnVideo addTarget:self action:@selector(didTappedAtButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnVideo];

        self.btnTerkini = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnTerkini.tag = btnMenuTerkini;
        _btnTerkini.frame = CGRectMake(terkiniStartX, terkiniStartY_4, BUTTON_WIDTH, BUTTON_WIDTH);
        _btnTerkini.backgroundColor = [UIColor redColor];
        [_btnTerkini addTarget:self action:@selector(didTappedAtButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnTerkini];

        [UIView animateWithDuration:0.1
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             _btnAkhram.frame = CGRectMake(akhramEndX_4, akhramEndY_4, BUTTON_WIDTH, BUTTON_WIDTH);
                             _btnManifesto.frame = CGRectMake(manifestoEndX_4, manifestoEndY_4, BUTTON_WIDTH, BUTTON_WIDTH);
                             _btnBlog.frame = CGRectMake(blogEndX_4, blogEndY_4, BUTTON_WIDTH, BUTTON_WIDTH);
                             _btnDiary.frame = CGRectMake(diaryEndX_4, diaryEndY_4, BUTTON_WIDTH, BUTTON_WIDTH);
                             _btnBerita.alpha = 1;
                             _btnVideo.frame = CGRectMake(videoEndX_4, videoEndY_4, BUTTON_WIDTH, BUTTON_WIDTH);
                             _btnTerkini.frame = CGRectMake(terkiniEndX, terkiniEndY, BUTTON_WIDTH, BUTTON_WIDTH);
                         }
                         completion:^(BOOL f){
                         }];
    }
    return self;
}

- (void)didTappedAtButton:(UIButton *)btn
{
    [UIView animateWithDuration:0.15
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         _btnAkhram.frame = CGRectMake(akhramStartX_4, akhramStartY_4, BUTTON_WIDTH, BUTTON_WIDTH);
                         _btnManifesto.frame = CGRectMake(manifestoStartX_4, manifestoStartY_4, BUTTON_WIDTH, BUTTON_WIDTH);
                         _btnBlog.frame = CGRectMake(blogStartX_4, blogStartY_4, BUTTON_WIDTH, BUTTON_WIDTH);
                         _btnDiary.frame = CGRectMake(diaryStartX_4, diaryStartY_4, BUTTON_WIDTH, BUTTON_WIDTH);
                         _btnBerita.alpha = 1;
                         _btnVideo.frame = CGRectMake(videoStartX_4, videoStartY_4, BUTTON_WIDTH, BUTTON_WIDTH);
                         _btnTerkini.frame = CGRectMake(terkiniStartX, terkiniStartY_4, BUTTON_WIDTH, BUTTON_WIDTH);
                     }
                     completion:^(BOOL f){
                         if ([_delegate respondsToSelector:@selector(didTappedAtButtonIndex:)])
                         {
                             [_delegate didTappedAtButtonIndex:btn.tag];
                             [self removeFromSuperview];
                         }
                     }];
}

@end
