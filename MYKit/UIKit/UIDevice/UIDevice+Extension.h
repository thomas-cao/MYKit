//
//  UIDevice+Extension.h
//  FXKitExampleDemo
//
//  Created by sunjinshuai on 2017/7/21.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Extension)

/**
 获取UUID
 */
+ (NSString *)generateUuidString;
/**
 设备版本
 */
+ (NSString*)deviceModel;

/**
 手机系统版本
 */
+ (NSString *)systemVersion;

/**
 网络监测
 */
+ (NSString *)getNetWorkStates;

/**
 IFV/IDFV (Identifier for Vendor)
 */
+ (NSString *)appleIFV;

/**
 获取当前版本号
 */
+ (NSString *)getVersionNumber;

@end
