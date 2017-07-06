//
//  UIView+HitoCategory.h
//  HitoTheme
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 KennyHito. All rights reserved.
//
/*
 类别的局限
 1.只能添加方法，不能添加属性。在类别中声明的属性，将无法存取。
 2.类别中的方法，会覆盖父类中的同名方法，无法再调用父类中的方法（因为类别中无法使用super），为防止意外覆盖，总是应该给类别加上前缀。
 3.不同文件中的同名类别，同名方法，不会报错，实际执行的方法以最后一个加载的文件为准，因此使用前缀防止类别人互相覆盖。
 */

#import <UIKit/UIKit.h>

@interface UIView (HitoCategory)




@end
