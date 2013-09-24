//
//  LBMenuView.h
//  animmenu
//
//  Created by saifuddin on 24/9/13.
//  Copyright (c) 2013 saifuddin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, btnMenu) {
    btnMenuAkhram = 3,
    btnMenuManifesto,
    btnMenuBlog,
    btnMenuDiary,
    btnMenuBerita,
    btnMenuVideo,
    btnMenuTerkini
};

@protocol LBMenuViewDelegate <NSObject>
@optional
- (void)didTappedAtButtonIndex:(btnMenu)index;
@end

@interface LBMenuView : UIView
@property (nonatomic, weak) id <LBMenuViewDelegate> delegate;
@end
