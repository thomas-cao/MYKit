//
//  UILabel+Extension.m
//  FXKitExampleDemo
//
//  Created by sunjinshuai on 2017/8/15.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UILabel+Extension.h"
#import "NSString+Extension.h"

@implementation UILabel (Extension)

- (void)setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing {
    if ([NSString isEmpty:text] || lineSpacing < 0) {
        return ;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, text.length)];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    
    self.attributedText = attributedString;
}

@end
