//
//  UIButton+ImagePosition.h
//  MYUtils
//
//  Created by sunjinshuai on 2017/8/28.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//  https://github.com/Phelthas/Demo_ButtonImageTitleEdgeInsets

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MYImagePosition) {
    MYImagePositionLeft = 0,              //图片在左，文字在右，默认
    MYImagePositionRight = 1,             //图片在右，文字在左
    MYImagePositionTop = 2,               //图片在上，文字在下
    MYImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (ImagePosition)

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)setImagePosition:(MYImagePosition)postion spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
