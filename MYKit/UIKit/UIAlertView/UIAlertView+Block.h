//
//  UIAlertView+Block.h
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIAlertViewDismissWithButtonBlock)(NSInteger buttonIndex);
typedef void (^UIAlertViewCancelBlock)(void);

@interface UIAlertView (Block)

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle;

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
                  otherButtonTitles:(NSArray *)otherButtonTitles
      didDismissConfirmButtionBlock:(UIAlertViewDismissWithButtonBlock)confirmButtionBlock
        didDismissCancelButtonBlock:(UIAlertViewCancelBlock)cancelButtonBlock;

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
                  otherButtonTitles:(NSArray *)otherButtonTitles
                           subViews:(NSArray *)subViews
      didDismissConfirmButtionBlock:(UIAlertViewDismissWithButtonBlock)confirmButtionBlock
        didDismissCancelButtonBlock:(UIAlertViewCancelBlock)cancelButtonBlock;

@end
