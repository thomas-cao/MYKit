//
//  NSString+Size.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/7.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Size)

/**
 简单计算文本占据的size
 */
- (CGSize)textSizeWithFont:(UIFont *)font;

/**
 根据字体、行数、行间距和constrainedWidth计算文本占据的size
 @param font 字体
 @param numberOfLines 显示文本行数，值为0不限制行数
 @param lineSpacing 行间距
 @param constrainedWidth 文本受限的宽度
 @param isLimitedToLines 记录文本是否被numberOfLines限制
 @return 返回文本占据的size
 */
- (CGSize)textSizeWithFont:(UIFont *)font
             numberOfLines:(NSInteger)numberOfLines
               lineSpacing:(CGFloat)lineSpacing
          constrainedWidth:(CGFloat)constrainedWidth
          isLimitedToLines:(BOOL * _Nonnull)isLimitedToLines;

@end

NS_ASSUME_NONNULL_END
