//
//  UINavigationItem+Target.m
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UINavigationItem+Target.h"

#define FXRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@implementation UINavigationItem (Target)

+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target
                                      action:(SEL)action
                                       image:(NSString *)image {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    CGRect frame = button.frame;
    frame.size = button.currentBackgroundImage.size;
    button.frame = frame;
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target
                                      action:(SEL)action
                                       image:(NSString *)image
                               selectedImage:(NSString *)selectedImage {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    CGRect frame = button.frame;
    frame.size = button.currentBackgroundImage.size;
    button.frame = frame;
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target
                                      action:(SEL)action
                                       title:(NSString *)title {
    return [self barButtonItemWithTarget:target action:action title:title selectedTitle:@""];
}

+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target
                                      action:(SEL)action
                                       title:(NSString *)title
                               selectedTitle:(NSString *)selectedTitle {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    [button setTitleColor:FXRGBColor(45, 45, 45) forState:UIControlStateNormal];
    [button setTitleColor:FXRGBColor(45, 45, 45) forState:UIControlStateSelected];
    [button sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
