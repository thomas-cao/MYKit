//
//  UIAlertView+Block.m
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>

static char kDismissBlockKey;
static char kCancelBlockKey;

@implementation UIAlertView (Block)

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    [alert show];
    return alert;
}

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
                  otherButtonTitles:(NSArray *)otherButtonTitles
      didDismissConfirmButtionBlock:(UIAlertViewDismissWithButtonBlock)confirmButtionBlock
        didDismissCancelButtonBlock:(UIAlertViewCancelBlock)cancelButtonBlock
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    
    for(NSString *buttonTitle in otherButtonTitles){
        [alert addButtonWithTitle:buttonTitle];
    }
    
    objc_setAssociatedObject(alert, &kDismissBlockKey, confirmButtionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(alert, &kCancelBlockKey, cancelButtonBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [alert show];
    return alert;
}

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
                  otherButtonTitles:(NSArray *)otherButtonTitles
                           subViews:(NSArray *)subViews
      didDismissConfirmButtionBlock:(UIAlertViewDismissWithButtonBlock)confirmButtionBlock
        didDismissCancelButtonBlock:(UIAlertViewCancelBlock)cancelButtonBlock
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    
    for(NSString *buttonTitle in otherButtonTitles){
        [alert addButtonWithTitle:buttonTitle];
    }
    for (UIView *view in subViews) {
        [alert addSubview:view];
    }
    
    objc_setAssociatedObject(alert, &kDismissBlockKey, confirmButtionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(alert, &kCancelBlockKey, cancelButtonBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [alert show];
    return alert;
}


+ (void)alertView:(UIAlertView *) alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIAlertViewDismissWithButtonBlock _dismissBlock = objc_getAssociatedObject(alertView, &kDismissBlockKey);
    UIAlertViewCancelBlock _cancelBlock = objc_getAssociatedObject(alertView, &kCancelBlockKey);
    
    if(buttonIndex == [alertView cancelButtonIndex]){
        if (_cancelBlock) {
            _cancelBlock();
        }
    } else {
        if (_dismissBlock) {
            _dismissBlock(buttonIndex - 1);
        }
    }
    _dismissBlock = nil;
    _cancelBlock = nil;
}

@end
