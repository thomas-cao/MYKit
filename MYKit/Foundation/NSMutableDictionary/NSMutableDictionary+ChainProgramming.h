//
//  NSMutableDictionary+ChainProgramming.h
//  MYKitDemo
//
//  Created by Michael on 2017/9/10.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSMutableDictionary (ChainProgramming)

/**
 利用链式编程去实现富文本属性的赋值
 */
- (NSMutableDictionary *(^)(CGFloat))font;
- (NSMutableDictionary *(^)(UIColor *))color;


@end
