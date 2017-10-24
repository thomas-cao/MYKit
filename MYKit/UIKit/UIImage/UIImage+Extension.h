//
//  UIImage+Extension.h
//  FXKitExampleDemo
//
//  Created by sunjinshuai on 2017/7/19.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 根据URL生成图片

 @param imageURL URL
 @return 图片
 */
+ (UIImage *)imageWithURL:(NSURL *)imageURL;

@end

