//
//  UIImageView+BetterFace.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//  https://github.com/croath/UIImageView-BetterFace

#import <UIKit/UIKit.h>

@interface UIImageView (BetterFace)

@property (nonatomic) BOOL needsBetterFace;
@property (nonatomic) BOOL fast;

void hack_uiimageview_bf();
- (void)setBetterFaceImage:(UIImage *)image;

@end
