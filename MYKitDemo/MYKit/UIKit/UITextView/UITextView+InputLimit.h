//
//  UITextView+InputLimit.h
//  MYUtils
//
//  Created by sunjinshuai on 2017/8/28.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (InputLimit)

@property (nonatomic, assign) NSInteger maxLength;//if <=0, no limit

@end

NS_ASSUME_NONNULL_END
