//
//  UIResponder+Chain.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (Chain)

/**
 *  @brief  响应者链
 *
 *  @return  响应者链
 */
- (NSString *)responderChainDescription;

@end

NS_ASSUME_NONNULL_END
