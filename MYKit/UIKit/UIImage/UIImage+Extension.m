//
//  UIImage+Extension.m
//  FXKitExampleDemo
//
//  Created by sunjinshuai on 2017/7/19.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UIImage+Extension.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (Extension)

+ (UIImage *)imageWithURL:(NSURL *)imageURL {
    NSData *data = [NSData dataWithContentsOfURL:imageURL];
    return [UIImage imageWithData:data];
}

@end
