//
//  UILabel+FitLines.m
//  MYUtils
//
//  Created by sunjinshuai on 2017/8/7.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UILabel+FitLines.h"
#import "NSString+Size.h"
#import <objc/runtime.h>

@implementation UILabel (FitLines)

/**
 文本适应于指定的行数
 @return 文本是否被numberOfLines限制
 */
- (BOOL)my_adjustTextToFitLines:(NSInteger)numberOfLines {
    
    if (!self.text || self.text.length == 0) {
        return NO;
    }
    
    self.numberOfLines = numberOfLines;
    BOOL isLimitedToLines = NO;
    
    CGSize textSize = [self.text textSizeWithFont:self.font
                                    numberOfLines:self.numberOfLines
                                      lineSpacing:self.myLineSpacing
                                 constrainedWidth:self.myConstrainedWidth
                                 isLimitedToLines:&isLimitedToLines];
    
    //单行的情况
    if (fabs(textSize.height - self.font.lineHeight) < 0.00001f) {
        self.myLineSpacing = 0.0f;
    }
    
    //设置文字的属性
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:self.myLineSpacing];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;//结尾部分的内容以……方式省略
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, [self.text length])];
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:self.textColor
                             range:NSMakeRange(0, [self.text length])];
    [attributedString addAttribute:NSFontAttributeName
                             value:self.font
                             range:NSMakeRange(0, [self.text length])];
    
    [self setAttributedText:attributedString];
    self.bounds = CGRectMake(0, 0, textSize.width, textSize.height);
    return isLimitedToLines;
}

#pragma MARK - setter & getter
/**
 行间距
 */
- (void)setMyLineSpacing:(CGFloat)myLineSpacing {
    
    objc_setAssociatedObject(self, @selector(myLineSpacing), [NSNumber numberWithFloat:myLineSpacing], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)myLineSpacing {
    
    return [objc_getAssociatedObject(self, @selector(myLineSpacing)) floatValue];
}

/**
 最大显示宽度
 */
- (void)setMyConstrainedWidth:(CGFloat)myConstrainedWidth {
    
    objc_setAssociatedObject(self, @selector(myConstrainedWidth), [NSNumber numberWithFloat:myConstrainedWidth], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)myConstrainedWidth {
    
    return [objc_getAssociatedObject(self, @selector(myConstrainedWidth)) floatValue];
}

- (void)adjustSizeAlignment:(MYAdjustAlignment)adjustAlignment {
    
    [self  adjustSizeAlignment:adjustAlignment
                       margins:5.0];
    
}

- (void)adjustSizeAlignment:(MYAdjustAlignment)adjustAlignment
                    margins:(CGFloat)margins {
    CGRect rect ;
    switch (adjustAlignment) {
        case MYAdjustAlignmentLeft:
        case MYAdjustAlignmentRight: {
            rect = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, CGRectGetHeight(self.frame)) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:[self attributes] context:nil];
            break;
        }
        case MYAdjustAlignmentBottom:
        case MYAdjustAlignmentTop: {
            rect = [self.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.frame),MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:[self attributes] context:nil];
            break;
        }
        case MYAdjustAlignmentCenter: {
            rect = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:[self attributes] context:nil];
            break;
        }
    }
    
    switch (adjustAlignment) {
        case MYAdjustAlignmentLeft: {
            self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(rect)+margins, CGRectGetHeight(self.frame)+margins);
            break;
        }
        case MYAdjustAlignmentRight: {
            self.frame = CGRectMake(CGRectGetMaxX(self.frame)-CGRectGetWidth(rect)-margins, CGRectGetMinY(self.frame), CGRectGetWidth(rect)+margins, CGRectGetHeight(self.frame)+margins);
            break;
        }
        case MYAdjustAlignmentBottom: {
            self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMaxY(self.frame)-CGRectGetHeight(rect)-margins, CGRectGetWidth(self.frame)+margins, CGRectGetHeight(rect)+margins);
            break;
        }
        case MYAdjustAlignmentTop: {
            self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame)+margins, CGRectGetHeight(rect)+margins);
            break;
        }
        case MYAdjustAlignmentCenter: {
            CGPoint center = self.center;
            self.frame = CGRectMake(0, 0, CGRectGetWidth(rect)+margins, CGRectGetHeight(rect)+margins);
            self.center = center;
            break;
        }
    }
}

- (NSDictionary *)attributes {
    
    return @{NSFontAttributeName:self.font};
    
}

@end
