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
}
- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.backgroundColor = [UIColor grayColor];
        _btn.frame = CGRectMake(0, HEIGHT - BTN_H, WIDTH, BTN_H);
        [_btn setTitle:@"退出登录" forState:UIControlStateNormal];
        _btn.userInteractionEnabled = YES;
        [_btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn];
    }
    return _btn;
}
- (void)BtnClick:(UIButton *)btn{
    LoginViewController*login = [[LoginViewController alloc] init];
    UINavigationController * nav=[[UINavigationController alloc]initWithRootViewController:login];
    [self presentViewController:nav animated:YES completion:^{
        [self clearUserInfo];
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
