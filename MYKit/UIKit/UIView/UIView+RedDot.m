//
//  UIView+RedDot.m
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/11/18.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UIView+RedDot.h"
#import "UIColor+Hex.h"
#import "NSObject+AssociatedObject.h"
#import <objc/runtime.h>

@interface UIView ()

@property (nonatomic, strong) UIView *badgeView;

@end

@implementation UIView (RedDot)

- (void)addRedDotWithRadius:(CGFloat)radius offsetX:(CGFloat)offsetX offsetY:(CGFloat)offsetY {
    CAShapeLayer *redDot = [self redDot];
    
    if (redDot) {
        [redDot removeFromSuperlayer];
    }
    
    UIBezierPath *redDotPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, radius*2, radius*2)];
    CAShapeLayer *redDotLayer = [CAShapeLayer layer];
    redDotLayer.fillColor = [UIColor redColor].CGColor;
    redDotLayer.frame = CGRectMake(CGRectGetWidth(self.frame)-radius+offsetX, -radius+offsetY, radius*2, radius*2);
    redDotLayer.path = redDotPath.CGPath;
    [self setRedDot:redDotLayer];
    [self.layer addSublayer:redDotLayer];
    redDotLayer.hidden = YES;
}

- (void)showRedDotWithRadius:(CGFloat)radius offsetX:(CGFloat)offsetX offsetY:(CGFloat)offsetY {
    
    CAShapeLayer *redDot = [self redDot];
    
    if (redDot) {
        [redDot removeFromSuperlayer];
    }
    
    UIBezierPath *redDotPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, radius*2, radius*2)];
    CAShapeLayer *redDotLayer = [CAShapeLayer layer];
    redDotLayer.fillColor = [UIColor redColor].CGColor;
    redDotLayer.frame = CGRectMake(CGRectGetMaxX(self.frame)-radius+offsetX, -radius+offsetY, radius*2, radius*2);
    redDotLayer.path = redDotPath.CGPath;
    [self setRedDot:redDotLayer];
    [self.layer addSublayer:redDotLayer];
}

- (void)showRedDot {
    CAShapeLayer *redDot = [self redDot];
    if (redDot) {
        redDot.hidden = NO;
    }
}

- (void)hiddenRedDot {
    CAShapeLayer *redDot = [self redDot];
    if (redDot) {
        redDot.hidden = YES;
    }
}

#pragma mark - private

- (CAShapeLayer *)redDot {
    return [self object:@selector(setRedDot:)];
}

- (void)setRedDot:(CAShapeLayer *)layer {
    [self setRetainNonatomicObject:layer withKey:@selector(setRedDot:)];
}

#pragma mark - properties
- (NSString *)badgeString {
    return [self object:@selector(setBadgeString:)];
}

- (void)setBadgeString:(NSString *)badgeString {
    [self setCopyNonatomicObject:badgeString withKey:@selector(setBadgeString:)];
}

- (BOOL)shouldShowBadge {
    return [[self object:@selector(setShouldShowBadge:)] boolValue];
}

- (void)setShouldShowBadge:(BOOL)shouldShowBadge {
    [self setRetainNonatomicObject:@(shouldShowBadge) withKey:@selector(setShouldShowBadge:)];
    
    if (self) {
        if (shouldShowBadge) {
            if(self.badgeString){
                if (self.badgeLabel == nil) {
                    self.badgeLabel = [[UILabel alloc] init];
                    self.badgeLabel.textAlignment = NSTextAlignmentCenter;
                    self.badgeLabel.textColor = [UIColor whiteColor];
                    self.badgeLabel.font = [UIFont systemFontOfSize:10];
                    self.badgeLabel.layer.cornerRadius = 6;
                    self.badgeLabel.layer.masksToBounds = YES;
                    self.badgeLabel.backgroundColor = [UIColor colorWithHexString:@"#FD3B46"];
                    self.badgeLabel.numberOfLines = 0;
                    [self addSubview:self.badgeLabel];
                    if (self.badgeConfigBlock) {
                        self.badgeConfigBlock(self.badgeLabel);
                    }
                }
                self.badgeLabel.text = self.badgeString;
                
            }
            else {
                if (self.badgeView == nil) {
                    self.badgeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 6, 6)];
                    self.badgeView.layer.cornerRadius = 3;
                    self.badgeView.backgroundColor = [UIColor colorWithHexString:@"#FF5E1C"];
                    [self addSubview:self.badgeView];
                    if (self.badgeConfigBlock) {
                        self.badgeConfigBlock(self.badgeView);
                    }
                }
            }
        }
        if (!shouldShowBadge && self.badgeView) {
            [self.badgeView removeFromSuperview];
            self.badgeView = nil;
        }
        if (!shouldShowBadge && self.badgeLabel){
            [self.badgeLabel removeFromSuperview];
            self.badgeLabel = nil;
        }
    }
}

- (void (^)(UIView *))badgeConfigBlock {
    return [self object:@selector(setBadgeConfigBlock:)];
}

- (void)setBadgeConfigBlock:(void (^)(UIView *))badgeConfigBlock {
    [self setCopyNonatomicObject:badgeConfigBlock withKey:@selector(setBadgeConfigBlock:)];
}

- (UIView *)badgeView {
    return [self object:@selector(setBadgeView:)];
}

- (void)setBadgeView:(UIView *)badgeView {
    [self setRetainNonatomicObject:badgeView withKey:@selector(setBadgeView:)];
}

- (UILabel *)badgeLabel{
    return [self object:@selector(setBadgeLabel:)];
}

- (void)setBadgeLabel:(UILabel *)badgeLabel{
    [self setRetainNonatomicObject:badgeLabel withKey:@selector(setBadgeLabel:)];
}

@end
