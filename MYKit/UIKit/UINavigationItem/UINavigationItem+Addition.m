//
//  UINavigationItem+Addition.m
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/11/18.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UINavigationItem+Addition.h"
#import "NSObject+Swizzling.h"

@implementation UINavigationItem (Addition)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL oldSelector = @selector(backBarButtonItem);
        SEL newSelector = @selector(ws_backBarButtonItem);
        
        [self instanceSwizzle:oldSelector newSelector:newSelector];
    });
}

- (UIBarButtonItem * _Nonnull)ws_backBarButtonItem {
    return [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
}

@end
