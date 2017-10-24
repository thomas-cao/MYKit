//
//  UIColor+Gradient.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/7.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Gradient)

/**
 *  @brief  渐变颜色
 *
 *  @param fromColor     开始颜色
 *  @param toColor     结束颜色
 *  @param height 渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor *)gradientFromColor:(UIColor *)fromColor
                       toColor:(UIColor *)toColor
                        height:(CGFloat)height;

@end
