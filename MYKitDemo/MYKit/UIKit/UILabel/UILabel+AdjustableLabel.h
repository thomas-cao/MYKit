//
//  UILabel+AdjustableLabel.h
//  MYUtils
//
//  Created by sunjinshuai on 2017/8/28.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//  https://github.com/edgarschmidt/ESAdjustableLabel-Category

#import <UIKit/UIKit.h>

@interface UILabel (AdjustableLabel)


// General method. If minSize is set to CGSizeZero then
// it is ignored
// =====================================================
- (void)adjustLabelToMaximumSize:(CGSize)maxSize
                     minimumSize:(CGSize)minSize
                 minimumFontSize:(int)minFontSize;

// Adjust label using only the maximum size and the
// font size as constraints
// =====================================================
- (void)adjustLabelToMaximumSize:(CGSize)maxSize
                 minimumFontSize:(int)minFontSize;

// Adjust the size of the label using only the font
// size as a constraint (the maximum size will be
// calculated automatically based on the screen size)
// =====================================================
- (void)adjustLabelSizeWithMinimumFontSize:(int)minFontSize;

// Adjust label without any constraints (the maximum
// size will be calculated automatically based on the
// screen size)
// =====================================================
- (void)adjustLabel;

@end
