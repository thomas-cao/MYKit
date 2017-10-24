//
//  UIActionSheet+Extension.h
//  FXKitExampleDemo
//
//  Created by sunjinshuai on 2017/7/20.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIActionSheetBlock) (UIActionSheet *actionSheet);
typedef void (^UIActionSheetCompletionBlock) (UIActionSheet *actionSheet, NSInteger buttonIndex);

@interface UIActionSheet (Extension)

@property (copy, nonatomic) UIActionSheetCompletionBlock tapBlock;
@property (copy, nonatomic) UIActionSheetCompletionBlock willDismissBlock;
@property (copy, nonatomic) UIActionSheetCompletionBlock didDismissBlock;

@property (copy, nonatomic) UIActionSheetBlock willPresentBlock;
@property (copy, nonatomic) UIActionSheetBlock didPresentBlock;
@property (copy, nonatomic) UIActionSheetBlock cancelBlock;

+ (instancetype)showFromTabBar:(UITabBar *)tabBar
                     withTitle:(NSString *)title
             cancelButtonTitle:(NSString *)cancelButtonTitle
        destructiveButtonTitle:(NSString *)destructiveButtonTitle
             otherButtonTitles:(NSArray *)otherButtonTitles
                      tapBlock:(UIActionSheetCompletionBlock)tapBlock;

+ (instancetype)showFromToolbar:(UIToolbar *)toolbar
                      withTitle:(NSString *)title
              cancelButtonTitle:(NSString *)cancelButtonTitle
         destructiveButtonTitle:(NSString *)destructiveButtonTitle
              otherButtonTitles:(NSArray *)otherButtonTitles
                       tapBlock:(UIActionSheetCompletionBlock)tapBlock;

+ (instancetype)showInView:(UIView *)view
                 withTitle:(NSString *)title
         cancelButtonTitle:(NSString *)cancelButtonTitle
    destructiveButtonTitle:(NSString *)destructiveButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
                  tapBlock:(UIActionSheetCompletionBlock)tapBlock;

+ (instancetype)showFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                             animated:(BOOL)animated
                            withTitle:(NSString *)title
                    cancelButtonTitle:(NSString *)cancelButtonTitle
               destructiveButtonTitle:(NSString *)destructiveButtonTitle
                    otherButtonTitles:(NSArray *)otherButtonTitles
                             tapBlock:(UIActionSheetCompletionBlock)tapBlock;

+ (instancetype)showFromRect:(CGRect)rect
                      inView:(UIView *)view
                    animated:(BOOL)animated
                   withTitle:(NSString *)title
           cancelButtonTitle:(NSString *)cancelButtonTitle
      destructiveButtonTitle:(NSString *)destructiveButtonTitle
           otherButtonTitles:(NSArray *)otherButtonTitles
                    tapBlock:(UIActionSheetCompletionBlock)tapBlock;

@end
