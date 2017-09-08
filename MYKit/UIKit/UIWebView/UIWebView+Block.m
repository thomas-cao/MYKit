//
//  UIWebView+Block.m
//  MYKitDemo
//
//  Created by sunjinshuai on 2017/9/7.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "UIWebView+Block.h"

static void (^_loadedBlock)(UIWebView *webView);
static void (^_failureBlock)(UIWebView *webView, NSError *error);
static void (^_loadStartedBlock)(UIWebView *webView);
static BOOL (^_shouldLoadBlock)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType);

static uint _loadedWebItems;

@implementation UIWebView (Block)

#pragma mark - UIWebView+Blocks

+ (UIWebView *)loadRequest:(NSURLRequest *)request
                      loaded:(void (^)(UIWebView *webView))loadedBlock
                      failed:(void (^)(UIWebView *webView, NSError *error))failureBlock{
    
    return [self loadRequest:request
                      loaded:loadedBlock
                      failed:failureBlock
                 loadStarted:nil
                  shouldLoad:nil];
}

+ (UIWebView *)loadHTMLString:(NSString *)htmlString
                         loaded:(void (^)(UIWebView *webView))loadedBlock
                         failed:(void (^)(UIWebView *webView, NSError *error))failureBlock{
    
    return [self loadHTMLString:htmlString
                         loaded:loadedBlock
                         failed:failureBlock
                    loadStarted:nil
                     shouldLoad:nil];
}

+ (UIWebView *)loadHTMLString:(NSString *)htmlString
                         loaded:(void (^)(UIWebView *))loadedBlock
                         failed:(void (^)(UIWebView *, NSError *))failureBlock
                    loadStarted:(void (^)(UIWebView *webView))loadStartedBlock
                     shouldLoad:(BOOL (^)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType))shouldLoadBlock{
    _loadedWebItems = 0;
    _loadedBlock = loadedBlock;
    _failureBlock = failureBlock;
    _loadStartedBlock = loadStartedBlock;
    _shouldLoadBlock = shouldLoadBlock;
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = (id)[self class];
    [webView loadHTMLString:htmlString baseURL:nil];
    
    return webView;
}

+ (UIWebView *)loadRequest:(NSURLRequest *)request
                      loaded:(void (^)(UIWebView *webView))loadedBlock
                      failed:(void (^)(UIWebView *webView, NSError *error))failureBlock
                 loadStarted:(void (^)(UIWebView *webView))loadStartedBlock
                  shouldLoad:(BOOL (^)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType))shouldLoadBlock {
    _loadedWebItems    = 0;
    
    _loadedBlock       = loadedBlock;
    _failureBlock      = failureBlock;
    _loadStartedBlock  = loadStartedBlock;
    _shouldLoadBlock   = shouldLoadBlock;
    
    UIWebView *webView  = [[UIWebView alloc] init];
    webView.delegate    = (id) [self class];
    
    [webView loadRequest: request];
    
    return webView;
}

#pragma mark - Private Static delegate
+ (void)webViewDidFinishLoad:(UIWebView *)webView {
    _loadedWebItems--;
    
    if(_loadedBlock && (!TRUE_END_REPORT || _loadedWebItems == 0)){
        _loadedWebItems = 0;
        _loadedBlock(webView);
    }
}

+ (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    _loadedWebItems--;
    
    if(_failureBlock)
        _failureBlock(webView, error);
}

+ (void)webViewDidStartLoad:(UIWebView *)webView {
    _loadedWebItems++;
    
    if(_loadStartedBlock && (!TRUE_END_REPORT || _loadedWebItems > 0))
        _loadStartedBlock(webView);
}

+ (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if(_shouldLoadBlock)
        return _shouldLoadBlock(webView, request, navigationType);
    
    return YES;
}


@end
