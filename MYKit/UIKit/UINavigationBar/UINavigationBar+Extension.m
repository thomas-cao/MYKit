//
//  UINavigationBar+Extension.m
//  FXKitExampleDemo
//
//  Created by sunjinshuai on 2017/7/20.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UINavigationBar+Extension.h"
#import <objc/runtime.h>

static const void *NavigationBarMaskViewKey = &NavigationBarMaskViewKey;

@implementation UINavigationBar (Extension)

- (void)reset
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.overlayView removeFromSuperview];
    self.overlayView = nil;
}

- (void)setOverlayViewAlpha:(CGFloat)alpha
{
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
    
    for (UIView *view in self.subviews) {
        
        Class _UIBarBackgroundClass = NSClassFromString(@"_UIBarBackground");
        if (_UIBarBackgroundClass != nil) {
            if ([view isKindOfClass:_UIBarBackgroundClass] == NO) {
                view.alpha = alpha;
            }
        }
        
        Class _UINavigationBarBackground = NSClassFromString(@"_UINavigationBarBackground");
        if (_UINavigationBarBackground != nil) {
            if ([view isKindOfClass:_UINavigationBarBackground] == NO) {
                view.alpha = alpha;
            }
        }
        
        Class _UINavigationBarBackIndicatorView = NSClassFromString(@"_UINavigationBarBackIndicatorView");
        if (_UINavigationBarBackIndicatorView != nil) {
            if ([view isKindOfClass:_UINavigationBarBackIndicatorView]) {
                view.hidden = YES;
            }
        }
    }
}

- (void)setNavigationBarForDividingLineHidden:(BOOL)hidden
{
    UIImageView *dividingLineView = [self navigationBarForDividingLine:self];
    dividingLineView.hidden = !hidden;
}

- (UIImageView *)navigationBarForDividingLine:(UIView *)dividingLineView
{
    if ([dividingLineView isKindOfClass:UIImageView.class] && dividingLineView.bounds.size.height <= 1.0) {
        return (UIImageView *)dividingLineView;
    }
    for (UIView *subview in dividingLineView.subviews) {
        UIImageView *imageView = [self navigationBarForDividingLine:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)setOverlayViewBackgroundColor:(UIColor *)backgroundColor
{
    if (!self.overlayView) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 64)];
        self.overlayView.userInteractionEnabled = NO;
        self.overlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [[self.subviews firstObject] insertSubview:self.overlayView atIndex:0];
    }
    self.overlayView.backgroundColor = backgroundColor;
}

#pragma mark - getter & setter
- (UIView *)overlayView
{
    return objc_getAssociatedObject(self, NavigationBarMaskViewKey);
}

- (void)setOverlayView:(UIView *)overlayView
{
    objc_setAssociatedObject(self, NavigationBarMaskViewKey, overlayView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
