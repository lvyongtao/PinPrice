//
//  SettingViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/23.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#define BTN_H 50

#import "SettingViewController.h"
#import "LoginViewController.h"

@interface SettingViewController ()

@property (strong, nonatomic) UIButton *btn;


@property (strong, nonatomic) UIButton *clearCacheBtn;


@property (strong, nonatomic) UILabel *lable;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavgationBar];
}
- (void)initNavgationBar{
    [self addTitleViewWithTitle:@"设置"];
    [self.btn setTintColor:[UIColor clearColor]];
    [self.clearCacheBtn setTintColor:[UIColor redColor]];
    
    double size = [[SDImageCache sharedImageCache] getSize] / 1000.0 / 1000.0;
    self.lable.text = [NSString stringWithFormat:@"%.2f M  %ldcount",size,[[SDImageCache sharedImageCache] getDiskCount]];
    
}
- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.backgroundColor = [UIColor grayColor];
        _btn.frame = CGRectMake(0,HEIGHT - BTN_H, WIDTH, BTN_H );
        [_btn setTitle:@"退出登录" forState:UIControlStateNormal];
        _btn.userInteractionEnabled = YES;
        [_btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn];
    }
    return _btn;
}
- (UILabel *)lable{
    if (!_lable) {
        _lable = [UILabel new];
        _lable.frame = CGRectMake(10, BTN_H*2 + 10, WIDTH - 20, BTN_H);
        _lable.backgroundColor = [UIColor grayColor];
        _lable.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_lable];
    }
    return _lable;
}
- (UIButton *)clearCacheBtn{
    if (!_clearCacheBtn) {
        _clearCacheBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _clearCacheBtn.backgroundColor = [UIColor grayColor];
        _clearCacheBtn.frame = CGRectMake(0, BTN_H, WIDTH, BTN_H);
        [_clearCacheBtn setTitle:@"清理缓存" forState:UIControlStateNormal];
        _clearCacheBtn.userInteractionEnabled = YES;
        [_clearCacheBtn addTarget:self action:@selector(clearBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_clearCacheBtn];
    }
    return _clearCacheBtn;
}
- (void)BtnClick:(UIButton *)btn{
    LoginViewController*login = [[LoginViewController alloc] init];
    UINavigationController * nav=[[UINavigationController alloc]initWithRootViewController:login];
    [self presentViewController:nav animated:YES completion:^{
        [self clearUserInfo];
    }];
}
- (void)clearBtnClick:(UIButton *)btn{
    [UIView MBAlertViewWithMsg:@"清理中..." With:self.view];
    
    [[SDImageCache sharedImageCache] clearMemory];
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        NSLog(@"清除完成");
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView MBHiddenAllWith:self.view];
            [self showMessageTitle:@"清理完成"];
            double size = [[SDImageCache sharedImageCache] getSize] / 1000.0 / 1000.0;
            self.lable.text = [NSString stringWithFormat:@"%.2f M  %ldcount",size,[[SDImageCache sharedImageCache] getDiskCount]];
        });
    }];
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
