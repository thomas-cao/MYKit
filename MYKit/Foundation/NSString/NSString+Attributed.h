//
//  NSString+Attributed.h
//  Zhibo
//
//  Created by 孙金帅 on 2016/10/26.
//  Copyright © 2016年 孙金帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Attributed)

+ (NSAttributedString *)stringWitParagraphStyle:(NSMutableParagraphStyle *)paragraphStyle
                                          title:(NSString *)title
                                          image:(UIImage *)image;

@end
