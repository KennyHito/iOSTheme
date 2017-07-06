//
//  HitoNavViewController.m
//  HitoTheme
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 KennyHito. All rights reserved.
//

#import "HitoNavViewController.h"

@interface HitoNavViewController ()

@end

@implementation HitoNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    if (self = [super initWithRootViewController:rootViewController]) {
        UINavigationBar *navBar = [[UINavigationBar alloc] init];
        // 设置主题颜色
        [navBar Hito_addToThemeColorPool:@"barTintColor"];
        navBar.tintColor = [UIColor blackColor];
        // 设置字体颜色
        NSDictionary *attributes = @{ NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName: [UIFont boldSystemFontOfSize:20]};
        navBar.titleTextAttributes = attributes;
        [self setValue:navBar forKey:@"navigationBar"];
    }
    return self;
}

#pragma mark - 设置状态栏白色
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}


@end
