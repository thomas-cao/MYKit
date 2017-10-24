//
//  NSString+Extension.h
//  FXKitExample
//
//  Created by sunjinshuai on 2017/7/17.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Extension)

/**
 Returns a lowercase NSString for md5 hash.
 */
- (NSString *)md5String;

/**
 判断字符串是否为空
 */
+ (BOOL)isEmpty:(NSString *)string;

/**
 字典转换字符串
 */
+ (NSString *)stringWithJSONObject:(id)obj;

/**
 字符串转换字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end
