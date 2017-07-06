//
//  NSObject+HitoThemeCategory.h
//  HitoTheme
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 KennyHito. All rights reserved.
//

#import <Foundation/Foundation.h>

// 主题色
#define HitoTHEME_THEME_COLOR @"HitoTHEME_THEME_COLOR"
/** 设置主题图片前调用此block */
typedef void (^HitoThemeImageSettingBlock)(const NSArray<id> *objects);

@interface NSObject (HitoThemeCategory)

/**
 * 添加到主题色池
 * selector : 执行方法
 * objects : 方法参数数组
 * 注意：方法参数必须按顺序一一对应，如果涉及到的主题色设置使用 HitoTHEME_THEME_COLOR 宏定义代替
 * 如果数组中某个参数为nil，需包装为 [NSNull null] 对象再添加到数组中
 */
- (void)Hito_addToThemeColorPoolWithSelector:(SEL)selector objects:(NSArray<id> *)objects;

/**
 * 从主题色池移除
 * selector : 执行方法
 */
- (void)Hito_removeFromThemeColorPoolWithSelector:(SEL)selector;

/**
 * 添加到主题色池
 * propertyName : 属性名
 */
- (void)Hito_addToThemeColorPool:(NSString *)propertyName;

/**
 * 从主题色池移除
 * propertyName : 属性名
 */
- (void)Hito_removeFromThemeColorPool:(NSString *)propertyName;
/**
 * 设置主题色
 * color : 主题色
 */
- (void)Hito_setThemeColor:(UIColor *)color;

/** 添加到主题图片池 */
- (void)Hito_addToThemeImagePool;

/** 从主题图片池中移除 */
- (void)Hito_removeFromThemeImagePool;

/**
 * 重新加载主题图片
 * themeColor : 主题色
 * block : 设置主题图片时调用的block
 */
- (void)Hito_reloadThemeImageWithThemeColor:(UIColor *)themeColor setting:(HitoThemeImageSettingBlock)block;

@end
