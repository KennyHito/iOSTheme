//
//  HitoTabBarViewController.m
//  HitoTheme
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 KennyHito. All rights reserved.
//

#import "HitoTabBarViewController.h"
#import "HitoTabBar.h"

@interface HitoTabBarViewController ()<HitoTabBarDelegate>

@end

@implementation HitoTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (instancetype)init{
    if (self = [super init]) {
        
        HitoTabBar *tabBar = [[HitoTabBar alloc]init];
        tabBar.delegate = self;
        // 自定义tabBar
        [self setValue:tabBar forKeyPath:@"tabBar"];
        
        [self setUpChildViewControllers];
       
    }
    return self;
}

// 设置子控制器
- (void)setUpChildViewControllers {
    
    [self addChildViewController:[[HitoViewController alloc] init] image:@"tab_home_nor" seletedImage:@"tab_home_press" title:@"首页"];
    [self addChildViewController:[[HitoViewController alloc] init] image:@"tab_classify_nor"  seletedImage:@"tab_classify_press"  title:@"分类"];
    [self addChildViewController:[[HitoViewController alloc] init] image:@"tab_community_nor"  seletedImage:@"tab_community_press"  title:@"社区"];
    [self addChildViewController:[[HitoViewController alloc] init] image:@"tab_me_nor"  seletedImage:@"tab_me_press"  title:@"我的"];
}

//添加子控制器
- (UIViewController *)addChildViewController:(UIViewController *)childController image:(NSString *)image seletedImage:(NSString *)selectedImage title:(NSString *)title {
    
    childController.title = title;
    // 设置图片
    [childController.tabBarItem setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [childController.tabBarItem setSelectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
    // 导航条
    HitoNavViewController *nav = [[HitoNavViewController alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
    
    return childController;
}

/* 实现代理方法 */
- (void)tabBarDidClickAddItem: (HitoTabBar *)tabBar{
    NSLog(@"center Button onClick");
    HitoAllocInit(centerViewController, vc);
    [self presentViewController:vc animated:YES completion:nil];
}

@end
