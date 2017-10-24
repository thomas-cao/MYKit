//
//  UIButton+CountDown.m
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UIButton+CountDown.h"

@implementation UIButton (CountDown)

- (void)scheduledTimerWithTimeInterval:(NSInteger)seconds
                        countDownTitle:(NSString *)title {
    [self scheduledTimerWithTimeInterval:seconds
                          countDownTitle:title
                              completion:nil];
}

- (void)scheduledTimerWithTimeInterval:(NSInteger)seconds
                        countDownTitle:(NSString *)title
                            completion:(void (^)(void))completion {
    // 倒计时时间
    __block NSInteger timeOut = seconds;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // 每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        // 倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.userInteractionEnabled = YES;
                if (completion) {
                    completion();
                }
            });
        } else {
            int allTime = (int)seconds + 1;
            int seconds = timeOut % allTime;
            NSString *timeStr = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:@"(%@)%@",timeStr,title] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}


- (void)scheduledTimerWithTimeInterval:(NSInteger)seconds
                                 title:(NSString *)title
                        countDownTitle:(NSString *)subTitle
                        titleTextColor:(UIColor *)titleTextColor
               countDownTitleTextColor:(UIColor *)countDownTitleTextColor {
    
    [self scheduledTimerWithTimeInterval:seconds
                                   title:title
                          countDownTitle:subTitle
                          titleTextColor:titleTextColor
                 countDownTitleTextColor:countDownTitleTextColor
                              completion:nil];
}

- (void)scheduledTimerWithTimeInterval:(NSInteger)seconds
                                 title:(NSString *)title
                        countDownTitle:(NSString *)subTitle
                        titleTextColor:(UIColor *)titleTextColor
               countDownTitleTextColor:(UIColor *)countDownTitleTextColor
                            completion:(void (^)(void))completion {
    __weak typeof(self) weakSelf = self;
    // 倒计时时间
    __block NSInteger timeOut = seconds;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // 每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        // 倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf setTitleColor:titleTextColor forState:UIControlStateNormal];
                [weakSelf setTitle:title forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = YES;
                if (completion) {
                    completion();
                }
            });
        } else {
            int allTime = (int)seconds + 1;
            int seconds = timeOut % allTime;
            NSString *timeStr = [NSString stringWithFormat:@"%0.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf setTitleColor:countDownTitleTextColor forState:UIControlStateNormal];
                [weakSelf setTitle:[NSString stringWithFormat:@"(%@)%@",timeStr,subTitle] forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

- (void)scheduledTimerWithTimeInterval:(NSInteger)seconds
                                 title:(NSString *)title
                        countDownTitle:(NSString *)subTitle
                  titleBackgroundColor:(UIColor *)titleBackgroundColor
         countDownTitleBackgroundColor:(UIColor *)countDownTitleBackgroundColor {
    [self scheduledTimerWithTimeInterval:seconds
                                   title:title
                          countDownTitle:subTitle
                    titleBackgroundColor:titleBackgroundColor
           countDownTitleBackgroundColor:countDownTitleBackgroundColor
                              completion:nil];
}

- (void)scheduledTimerWithTimeInterval:(NSInteger)seconds
                                 title:(NSString *)title
                        countDownTitle:(NSString *)subTitle
                  titleBackgroundColor:(UIColor *)titleBackgroundColor
         countDownTitleBackgroundColor:(UIColor *)countDownTitleBackgroundColor
                            completion:(void (^)(void))completion {
    __weak typeof(self) weakSelf = self;
    // 倒计时时间
    __block NSInteger timeOut = seconds;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // 每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        // 倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.backgroundColor = titleBackgroundColor;
                [weakSelf setTitle:title forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = YES;
                if (completion) {
                    completion();
                }
            });
        } else {
            int allTime = (int)seconds + 1;
            int seconds = timeOut % allTime;
            NSString *timeStr = [NSString stringWithFormat:@"%0.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.backgroundColor = countDownTitleBackgroundColor;
                [weakSelf setTitle:[NSString stringWithFormat:@"(%@)%@",timeStr,subTitle] forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

@end
