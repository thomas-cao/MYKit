//
//  UIView+Screenshot.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Screenshot)

/**
 *  @brief  view截图
 */
- (UIImage *)screenshot;

/**
 *
 *  @brief 根据maxWidth截图一个view中的视图
 */
- (UIImage *)screenshot:(CGFloat)maxWidth;

@end
