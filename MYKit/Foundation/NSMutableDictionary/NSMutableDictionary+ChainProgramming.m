//
//  NSMutableDictionary+ChainProgramming.m
//  MYKitDemo
//
//  Created by Michael on 2017/9/10.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "NSMutableDictionary+ChainProgramming.h"

@implementation NSMutableDictionary (ChainProgramming)

- (NSMutableDictionary *(^)(CGFloat))font {
    return ^id(CGFloat font) {
        [self setValue:[UIFont systemFontOfSize:font] forKey:NSFontAttributeName];
        return self;
    };
}

- (NSMutableDictionary *(^)(UIColor *))color {
    return ^id(UIColor * color) {
        [self setValue:color forKey:NSForegroundColorAttributeName];
        return self;
    };
}

@end
