//
//  HitoTabBar.m
//  HitoTheme
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 KennyHito. All rights reserved.
//

#import "HitoTabBar.h"
#define ControllerCount 4
#define TabBarHeight 49

@interface HitoTabBar()

@property (nonatomic, strong) UIView *addButton;

@end

@implementation HitoTabBar

@dynamic delegate;
/*
 @dynamic 告诉编译器：属性的 setter 与 getter 方法由用户自己实现，不自动生成。（当然对于 readonly 的属性只需提供 getter 即可）。假如一个属性被声明为 @dynamic var，然后你没有提供 @setter方法和 @getter 方法，编译的时候没问题，但是当程序运行到 instance.var = someVar，由于缺 setter 方法会导致程序崩溃；或者当运行到 someVar = var 时，由于缺 getter 方法同样会导致崩溃。编译时没问题，运行时才执行相应的方法，这就是所谓的动态绑定。
 */

- (instancetype)init {
    
    if (self = [super init]) {
        // 添加中间add按钮
        UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [addBtn setImage:[[UIImage imageNamed:@"tab_publish_nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        [addBtn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
        self.addButton = addBtn;
        [self addSubview:addBtn];
        [self Hito_addToThemeColorPool:@"tintColor"];
    }
    return self;
}

- (void)addClick {
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickAddItem:)]) {
        [self.delegate tabBarDidClickAddItem:self];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width / (ControllerCount + 1);
     self.addButton.frame = CGRectMake((HitoScreenW - width)* 0.5, 0, width, TabBarHeight);
    // 下标
    NSUInteger index = 0;
    // 判断是否为控制器按钮
    for (UIView *view in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view.class isSubclassOfClass:class]) {
            int  x = index * width;
            CGRect frame = view.frame;
            view.frame = CGRectMake(x, frame.origin.y, width, frame.size.height);
            index ++;
            if (index == 2) {
                index ++;
            }
        }
    }
}

@end
