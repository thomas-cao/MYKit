//
//  NSBundle+AppIcon.m
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/8.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "NSBundle+AppIcon.h"

@implementation NSBundle (AppIcon)

- (NSString *)appIconPath {
    NSString *iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString *iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString *iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

- (UIImage *)appIcon {
    return [[UIImage alloc] initWithContentsOfFile:[self appIconPath]];
}

@end
