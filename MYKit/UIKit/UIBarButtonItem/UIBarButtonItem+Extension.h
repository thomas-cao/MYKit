//
//  UIBarButtonItem+Extension.h
//  FXKitExampleDemo
//
//  Created by sunjinshuai on 2017/7/20.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target
                                      action:(SEL)action
                                       image:(NSString *)image;

+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target
                                      action:(SEL)action
                                       image:(NSString *)image
                               selectedImage:(NSString *)selectedImage;

+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target
                                      action:(SEL)action
                                       title:(NSString *)title
                               selectedTitle:(NSString *)selectedTitle;

@end

