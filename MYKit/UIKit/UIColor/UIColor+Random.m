//
//  UIColor+Random.m
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UIColor+Random.h"

@implementation UIColor (Random)

+ (UIColor *)randomColor {
    
    CGFloat hue = ( arc4random() % 256 / 256.0);
    CGFloat saturation = ( arc4random() % 128 / 256.0) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
