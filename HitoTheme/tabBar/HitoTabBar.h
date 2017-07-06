//
//  HitoTabBar.h
//  HitoTheme
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 KennyHito. All rights reserved.
//

#import <UIKit/UIKit.h>
//导入头文件
@class HitoTabBar;

@protocol HitoTabBarDelegate <UITabBarDelegate>

@optional
//点击中间加号的代理（可选）
- (void)tabBarDidClickAddItem: (HitoTabBar *)tabBar;

@end


@interface HitoTabBar : UITabBar

@property (nonatomic, weak) id<HitoTabBarDelegate>delegate;


@end
