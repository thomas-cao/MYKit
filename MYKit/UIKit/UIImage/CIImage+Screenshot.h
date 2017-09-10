//
//  CIImage+Screenshot.h
//  MYKitDemo
//
//  Created by Michael on 2017/9/10.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CIImage (Screenshot)

/*
 * 根据CIImage生成指定大小的UIImage
 *
 * @param size 图片宽度
 */
- (UIImage *)createNonInterpolatedWithSize:(CGFloat)size;


@end
