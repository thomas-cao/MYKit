//
//  NSData+GZip.h
//  FXBEST
//
//  Created by Michael on 16/6/23.
//  Copyright © 2016年 51fanxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (GZip)

/**
 Decompress data from gzip data.
 @return Inflated data.
 */
- (nullable NSData *)gzipInflate;

/**
 Comperss data to gzip in default compresssion level.
 @return Deflated data.
 */
- (nullable NSData *)gzipDeflate;

@end
