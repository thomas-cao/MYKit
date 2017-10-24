//
//  NSString+Attributed.m
//  Zhibo
//
//  Created by 孙金帅 on 2016/10/26.
//  Copyright © 2016年 孙金帅. All rights reserved.
//

#import "NSString+Attributed.h"

@implementation NSString (Attributed)

+ (NSAttributedString *)stringWitParagraphStyle:(NSMutableParagraphStyle *)paragraphStyle
                                          title:(NSString *)title
                                          image:(UIImage *)image {

    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] init];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:title];
    
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = image;
    // 设置图片大小
    attch.bounds = CGRectMake(0, -2,image.size.width,image.size.height);
    
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    
    [attributedText appendAttributedString:string];
    [attributedText appendAttributedString:text];
    
    [attributedText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    
    return attributedText;
}

@end
