//
//  NSMutableAttributedString+ChainProgramming.m
//  MYKitDemo
//
//  Created by Michael on 2017/9/10.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "NSMutableAttributedString+ChainProgramming.h"

@implementation NSMutableAttributedString (ChainProgramming)

+ (NSMutableAttributedString *)makeAttributeString:(NSString *)string
                                         attribute:(void(^)(NSMutableDictionary *attributes))block {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    block(attributes);
    return [[NSMutableAttributedString alloc] initWithString:string attributes:attributes];;
}


- (NSMutableAttributedString *)makeAttributeStringAdd:(NSString *)string
                                            attribute:(void(^)(NSMutableDictionary *attributes))block {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    block(attributes);
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:attributes];
    [self appendAttributedString:attributedString];
    return self;
}

@end
