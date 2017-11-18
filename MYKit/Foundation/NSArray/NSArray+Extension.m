//
//  NSArray+Extension.m
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/11/18.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

- (CGFloat)getSum {
    return [[self valueForKeyPath:@"@sum.self"] floatValue];
}

- (CGFloat)getMax {
    return [[self valueForKeyPath:@"@max.self"] floatValue];
}

- (NSArray *)randomCopy {
    NSMutableArray *mutableArray = [self mutableCopy];
    NSUInteger count = [mutableArray count];
    if (count > 1) {
        for (NSUInteger i = count - 1; i > 0; --i) {
            [mutableArray exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform((int32_t)(i + 1))];
        }
    }
    return [mutableArray copy];
}

@end
