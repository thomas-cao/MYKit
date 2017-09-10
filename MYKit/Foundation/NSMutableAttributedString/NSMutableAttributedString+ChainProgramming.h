//
//  NSMutableAttributedString+ChainProgramming.h
//  MYKitDemo
//
//  Created by Michael on 2017/9/10.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (ChainProgramming)

/*
 快速创建属性字符串
 
 @param string 字符串
 @param block 返回attributes
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)makeAttributeString:(NSString *)string
                                         attribute:(void(^)(NSMutableDictionary *attributes))block;

/**
 拼接属性字符串
 
 @param string 字符串
 @param block 返回attributes
 @return NSMutableAttributedString
 */
- (NSMutableAttributedString *)makeAttributeStringAdd:(NSString *)string
                                            attribute:(void(^)(NSMutableDictionary *attributes))block;

@end
