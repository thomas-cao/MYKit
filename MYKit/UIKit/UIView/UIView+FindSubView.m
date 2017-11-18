//
//  UIView+FindSubView.m
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/11/18.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UIView+FindSubView.h"

@implementation UIView (FindSubView)

- (NSArray *)subviewsWithClass:(Class)cls {
    NSMutableArray *subviews = [NSMutableArray array];
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:cls]) {
            [subviews addObject:subview];
            [subviews addObjectsFromArray:[subview subviewsWithClass:cls]];
        }
    }
    return subviews;
}

@end
