//
//  NSDictionary+JSONString.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/8.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (JSONString)

/**
 NSDictionary转换成JSON字符串
 
 @return  JSON字符串
 */
- (NSString *)JSONString;

@end

NS_ASSUME_NONNULL_END
