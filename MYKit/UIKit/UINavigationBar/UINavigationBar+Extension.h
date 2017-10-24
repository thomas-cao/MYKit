//
//  UINavigationBar+Extension.h
//  FXKitExampleDemo
//
//  Created by sunjinshuai on 2017/7/20.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Extension)

/**
 隐藏导航栏分割线
 */
- (void)setNavigationBarForDividingLineHidden:(BOOL)hidden;

/**
 设置导航栏背景
 */
- (void)setOverlayViewBackgroundColor:(UIColor *)backgroundColor;
- (void)setOverlayViewAlpha:(CGFloat)alpha;

/**
 重置
 */
- (void)reset;

@end
