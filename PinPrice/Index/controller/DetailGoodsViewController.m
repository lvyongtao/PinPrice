//
//  DetailGoodsViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/25.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "DetailGoodsViewController.h"
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScript.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"

@interface DetailGoodsViewController ()<NJKWebViewProgressDelegate,UIWebViewDelegate>

@property (strong ,nonatomic) UIWebView *webview;

@property (strong, nonatomic) NJKWebViewProgressView *progressView;
@property (strong, nonatomic) NJKWebViewProgress *progressProxy;

@property (copy, nonatomic) NSString *titles;
@end

@implementation DetailGoodsViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:self.progressView];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_progressView removeFromSuperview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadrequest];
    // Do any additional setup after loading the view from its nib.
}
- (void)initNavgationBar{
    [self addTitleViewWithTitle:self.titles];
}
#pragma mark --lazyload
- (NJKWebViewProgressView *)progressView{
    if (!_progressView) {
        CGFloat progressBarHeight = 2.f;
        CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
        CGRect barFrame = CGRectMake(0, navigationBarBounds.size.height - progressBarHeight, navigationBarBounds.size.width, progressBarHeight);
        _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
        _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    }
    return _progressView;
}
-(UIWebView *)webview{
    if (!_webview) {
        _progressProxy = [[NJKWebViewProgress alloc] init];
        _progressProxy.webViewProxyDelegate = self;
        _progressProxy.progressDelegate = self;
        _webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        _webview.delegate = _progressProxy;
        _webview.backgroundColor = [UIColor whiteColor];
        _webview.scalesPageToFit = YES;
        _webview.scrollView.bounces = YES;
        _webview.paginationMode = UIWebPaginationModeUnpaginated;
        [self.view addSubview:_webview];
    }
    return _webview;
}
#pragma mark -- UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.navigationController.navigationBar addSubview:_progressView];
    
    if (![Reachability_NetConnect NetConnect]) {[self showMessageTitle:@"请检查网络连接"];return;}
    
    [self showLoadingAnimation];
    NSLog(@"开始加载");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self stopLoadingAnimation];
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString *alert = @"alert(js)";
    [context evaluateScript:alert];
    NSLog(@"加载完成");
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"加载失败原因%@",error);
}

- (void)loadrequest{
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress{
    [_progressView setProgress:progress animated:YES];
    
    self.titles = [self.webview stringByEvaluatingJavaScriptFromString:@"document.title"];
    if (progress == 1.0) {
        NSLog(@"---->%@",self.title);
        [self initNavgationBar];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
