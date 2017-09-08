//
//  NSString+Encode.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/8.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encode)

/**
 Returns an NSString for base64 encoded.
 */
- (nullable NSString *)base64EncodedString;

/**
 Returns an NSString from base64 encoded string.
 @param base64Encoding The encoded string.
 */
+ (nullable NSString *)stringWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 URL encode a string in utf-8.
 @return the encoded string.
 */
- (NSString *)stringByURLEncode;

/**
 URL decode a string in utf-8.
 @return the decoded string.
 */
- (NSString *)stringByURLDecode;

/**
 Escape common HTML to Entity.
 Example: "a<b" will be escape to "a&lt;b".
 */
- (NSString *)stringByEscapingHTML;

@end
