//
//  ViewController.m
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+CornerRadius.h"
#import "UIImage+Color.h"
#import "UIImageView+CornerRadius.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.imageView.myCornerRadius = 50.0f;
    
    self.imageView.image = [self.imageView.image circleImage];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
