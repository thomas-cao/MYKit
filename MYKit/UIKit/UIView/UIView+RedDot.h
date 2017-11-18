//
//  UIView+RedDot.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/11/18.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RedDot)

- (void)addRedDotWithRadius:(CGFloat)radius offsetX:(CGFloat)offsetX offsetY:(CGFloat)offsetY;

- (void)showRedDotWithRadius:(CGFloat)radius offsetX:(CGFloat)offsetX offsetY:(CGFloat)offsetY;

- (void)showRedDot;

- (void)hiddenRedDot;

/**
 *  @brief 是否显示badge
 */
@property (nonatomic, assign) BOOL shouldShowBadge;

/**
 *  @brief badge内容，为空则显示小红点
 */
@property (nonatomic, copy) NSString *badgeString;

@property (nonatomic, strong) UILabel *badgeLabel;


/**
 *  @brief 配置badge，参数UIView didMoveToSuperview
 */
@property (nonatomic, copy, nullable) void (^badgeConfigBlock)(UIView *);

@end
