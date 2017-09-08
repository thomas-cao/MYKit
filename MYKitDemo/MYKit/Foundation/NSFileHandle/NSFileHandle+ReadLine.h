//
//  NSFileHandle+ReadLine.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/8.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileHandle (ReadLine)

- (NSData *)readLineWithDelimiter:(NSString *)theDelimier;

@end
