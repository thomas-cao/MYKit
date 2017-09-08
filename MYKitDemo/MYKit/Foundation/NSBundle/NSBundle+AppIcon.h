//
//  NSBundle+AppIcon.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/8.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (AppIcon)

- (NSString *)appIconPath;
- (UIImage *)appIcon;

@end

NS_ASSUME_NONNULL_END
