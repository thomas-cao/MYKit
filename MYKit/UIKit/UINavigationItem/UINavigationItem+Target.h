//
//  UINavigationItem+Target.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationItem (Target)

+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target
action:(SEL)action
                                       image:(NSString *)image;

+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target
                                      action:(SEL)action
                                       image:(NSString *)image
                               selectedImage:(NSString *)selectedImage;

+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target
                                      action:(SEL)action
                                       title:(NSString *)title;

+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target
                                      action:(SEL)action
                                       title:(NSString *)title
                               selectedTitle:(NSString *)selectedTitle;

@end

NS_ASSUME_NONNULL_END
