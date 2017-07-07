//
//  UIView+HitoCategory.m
//  HitoTheme
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 KennyHito. All rights reserved.
//

#import "UIView+HitoCategory.h"

@implementation UIView (HitoCategory)

- (void)setHitoX:(CGFloat)x{
    CGRect f = self.frame;
    f.origin.x = x;
    self.frame = f;
}
- (CGFloat)HitoX{
    return self.frame.origin.x;
}

- (void)setHitoY:(CGFloat)y{
    CGRect f = self.frame;
    f.origin.y = y;
    self.frame = f;
}
- (CGFloat)HitoY{
    return self.frame.origin.y;
}

- (void)setHitoWidth:(CGFloat)width{
    CGRect f = self.frame;
    f.size.width = width;
    self.frame = f;
}
- (CGFloat)HitoWidth{
    return self.frame.size.width;
}

- (void)setHitoHeight:(CGFloat)height{
    CGRect f = self.frame;
    f.size.height = height;
    self.frame = f;
}
- (CGFloat)HitoHeight{
    return self.frame.size.height;
}



@end
