//
//  UIView+Screenshot.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Screenshot)

/**
 *  @brief  view截图
 *
 *  @return 截图
 */
- (UIImage *)screenshot;

/**
 *
 *  @brief 根据maxWidth截图一个view中的视图
 *
 *  @param maxWidth  最大宽度
 *
 *  @return 截图
 */
- (UIImage *)screenshot:(CGFloat)maxWidth;

@end

NS_ASSUME_NONNULL_END
