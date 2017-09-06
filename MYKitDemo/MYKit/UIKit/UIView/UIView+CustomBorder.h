//
//  UIView+CustomBorder.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, JKExcludePoint) {
    JKExcludeStartPoint = 1 << 0,
    JKExcludeEndPoint = 1 << 1,
    JKExcludeAllPoint = ~0UL
};

@interface UIView (CustomBorder)

- (void)addTopBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth;
- (void)addLeftBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth;
- (void)addBottomBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth;
- (void)addRightBorderWithColor:(UIColor *)color width:(CGFloat)borderWidth;

- (void)removeTopBorder;
- (void)removeLeftBorder;
- (void)removeBottomBorder;
- (void)removeRightBorder;


- (void)addTopBorderWithColor:(UIColor *)color
                        width:(CGFloat)borderWidth
                 excludePoint:(CGFloat)point
                     edgeType:(JKExcludePoint)edge;

- (void)addLeftBorderWithColor:(UIColor *)color
                         width:(CGFloat)borderWidth
                  excludePoint:(CGFloat)point
                      edgeType:(JKExcludePoint)edge;

- (void)addBottomBorderWithColor:(UIColor *)color
                           width:(CGFloat)borderWidth
                    excludePoint:(CGFloat)point
                        edgeType:(JKExcludePoint)edge;

- (void)addRightBorderWithColor:(UIColor *)color
                          width:(CGFloat)borderWidth
                   excludePoint:(CGFloat)point
                       edgeType:(JKExcludePoint)edge;

@end
