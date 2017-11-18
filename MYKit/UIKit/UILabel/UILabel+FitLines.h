//
//  UILabel+FitLines.h
//  MYUtils
//
//  Created by sunjinshuai on 2017/8/7.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MYAdjustAlignment) {
    MYAdjustAlignmentLeft,
    MYAdjustAlignmentRight,
    MYAdjustAlignmentBottom,
    MYAdjustAlignmentTop,
    MYAdjustAlignmentCenter,
};

@interface UILabel (FitLines)

/**
 最大显示宽度
 */
@property (nonatomic, assign) CGFloat myConstrainedWidth;


/**
 行间距
 */
@property (nonatomic, assign) CGFloat myLineSpacing;


/**
 文本适应于指定的行数
 @return 文本是否被numberOfLines限制
 */
- (BOOL)my_adjustTextToFitLines:(NSInteger)numberOfLines;

/**
 *  adjust label size and orgin point
 *  MYAdjustAlignmentLeft LPDAdjustAlignmentRight H adjust
 *  MYAdjustAlignmentBottom LPDAdjustAlignmentTop V adjust
 *
 */

- (void)adjustSizeAlignment:(MYAdjustAlignment)adjustAlignment;

- (void)adjustSizeAlignment:(MYAdjustAlignment)adjustAlignment
                    margins:(CGFloat)margins;


@end
