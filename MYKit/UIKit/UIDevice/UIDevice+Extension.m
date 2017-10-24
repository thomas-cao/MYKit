//
//  UIDevice+Extension.m
//  FXKitExampleDemo
//
//  Created by sunjinshuai on 2017/7/21.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UIDevice+Extension.h"
#import "sys/utsname.h"
#import "NSString+Extension.h"
#import "sys/utsname.h"
#import <sys/socket.h> // Per msqr
#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>
#import <sys/sockio.h>
#import <sys/ioctl.h>
#import <arpa/inet.h>

@implementation UIDevice (Extension)

+ (NSString *)generateUuidString {
    // create a new UUID which you own
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    
    // create a new CFStringRef (toll-free bridged to NSString)
    // that you own
    NSString *uuidString = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));
    // release the UUID
    CFRelease(uuid);
    
    return uuidString;
}

+ (NSString*)deviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceString;
}

+ (NSString *)systemVersion
{
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)device_brand
{
    return [UIDevice currentDevice].model;
}

+ (NSString *)getNetWorkStates
{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    NSString *state = @"";
    int netType = 0;
    
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
            
            switch (netType) {
                case 0:
                    state = @"Unknown";
                    break;
                case 1:
                    state = @"2G";
                    break;
                case 2:
                    state = @"3G";
                    break;
                case 3:
                    state = @"4G";
                    break;
                case 5:
                    state = @"WIFI";
                    break;
                default:
                    break;
            }
        }
    }
    return state;
}

+ (NSString *)appleIFV
{
    NSString *appleIdfv = [UIDevice currentDevice].identifierForVendor.UUIDString;
    return appleIdfv.md5String;
}

+ (NSString *)getVersionNumber
{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}


@end
