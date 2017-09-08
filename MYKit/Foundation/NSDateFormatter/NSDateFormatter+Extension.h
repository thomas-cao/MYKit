//
//  NSDateFormatter+Extension.h
//  MYUtils
//
//  Created by sunjinshuai on 2017/8/27.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDateFormatter (Extension)

+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format;
+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone;
+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;
+ (NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)style;
+ (NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;
+ (NSDateFormatter *)dateFormatterWithTimeStyle:(NSDateFormatterStyle)style;
+ (NSDateFormatter *)dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;

@end

NS_ASSUME_NONNULL_END
