//
//  nextViewController.h
//  HitoTheme
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 KennyHito. All rights reserved.
//

#import <UIKit/UIKit.h>

//设置代理
@protocol nextDelegate <NSObject>

@optional
- (void)sendMessage:(NSString *)message;

@end


@interface nextViewController : UIViewController

@property (nonatomic,weak)id<nextDelegate>delegate;

@end
