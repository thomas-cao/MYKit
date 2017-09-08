//
//  UIImage+Screenshot.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Screenshot)

/**
 *  @brief  截图指定view成图片
 *
 *  @param view 一个view
 *
 *  @return 图片
 */
+ (UIImage *)captureWithView:(UIView *)view;

/**
 *  @brief  从原来图片截取图片
 *
 *  @param imageRect 尺寸
 *
 *  @return 图片
 */
+ (UIImage *)captureImageWithRect:(CGRect)imageRect originalImage:(UIImage *)originalImage;

/**
 *
 *  @brief  截图一个view中所有视图 包括旋转缩放效果
 *
 *  @param view    指定的view
 *  @param maxWidth 宽的大小 0为view默认大小
 *
 *  @return 截图
 */
+ (UIImage *)screenshotWithView:(UIView *)view limitWidth:(CGFloat)maxWidth;

@end

NS_ASSUME_NONNULL_END
