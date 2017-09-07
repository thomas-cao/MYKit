//
//  UITextView+PlaceHolder.m
//  MYUtils
//
//  Created by sunjinshuai on 2017/8/28.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UITextView+PlaceHolder.h"
#import <objc/runtime.h>

static const char *UITextView_placeHolderTextViewKey = "UITextView_placeHolderTextViewKey";

@implementation UITextView (PlaceHolder)

- (UITextView *)placeHolderTextView {
    return objc_getAssociatedObject(self, UITextView_placeHolderTextViewKey);
}

- (void)setPlaceHolderTextView:(UITextView *)placeHolderTextView {
    objc_setAssociatedObject(self, UITextView_placeHolderTextViewKey, placeHolderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addPlaceHolder:(NSString *)placeHolder {
    if (![self placeHolderTextView]) {
        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor grayColor];
        textView.userInteractionEnabled = NO;
        textView.text = placeHolder;
        [self addSubview:textView];
        [self setPlaceHolderTextView:textView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textViewDidBeginEditing:)
                                                     name:UITextViewTextDidBeginEditingNotification
                                                   object:self];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textViewDidEndEditing:)
                                                     name:UITextViewTextDidEndEditingNotification
                                                   object:self];
        
    }
    self.placeHolderTextView.text = placeHolder;
}

# pragma mark -
# pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(NSNotification *)noti {
    self.placeHolderTextView.hidden = YES;
}

- (void)textViewDidEndEditing:(UITextView *)noti {
    if (self.text && [self.text isEqualToString:@""]) {
        self.placeHolderTextView.hidden = NO;
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
