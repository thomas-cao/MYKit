//
//  UIScreen+Accessor.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/11/18.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (Accessor)

/**
 *  @brief  主屏幕的bounds
 *
 *  @return bounds
 */
+ (CGRect)bounds;

/**
 *  @brief  主屏幕的size
 *
 *  @return size
 */
+ (CGSize)size;

/**
 *  @brief  主屏幕的width
 *
 *  @return width
 */
+ (CGFloat)width;

/**
 *  @brief  主屏幕的height
 *
 *  @return height
 */
+ (CGFloat)height;

/**
 *  @brief  当前屏幕的size
 */
@property (nonatomic, readonly) CGSize size;

/**
 *  @brief  当前屏幕的width
 */
@property (nonatomic, readonly) CGFloat width;

/**
 *  @brief  当前屏幕的height
 */
@property (nonatomic, readonly) CGFloat height;

/**
 *  @brief  状态栏的高度
 *
 *  @return CGFloat
 */
+ (CGFloat)statusBarHeight;

/**
 *  @brief  导航栏的高度
 *
 *  @return CGFloat
 */
+ (CGFloat)navigationBarHeight;

/**
 *  @brief  工具栏的高度
 *
 *  @return CGFloat
 */
+ (CGFloat)toolBarHeight;

/**
 *  @brief  tab菜单的高度
 *
 *  @return CGFloat
 */
+ (CGFloat)scale;

+ (CGFloat)tabBarHeight;

+ (CGFloat)ceilPixelValue:(CGFloat)pixelValue;

+ (CGFloat)roundPixelValu:(CGFloat)pixelValue;

+ (CGFloat)floorPixelValue:(CGFloat)pixelValue;

+ (CGFloat)pixelResize:(CGFloat)value;

+ (CGRect)pixelFrameResize:(CGRect)value;

+ (CGPoint)pixelPointResize:(CGPoint)value;

+ (CGFloat)screenResizeScale;

+ (CGFloat)screenHeightResizeScale;

@end
