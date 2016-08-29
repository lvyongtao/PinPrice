//
//  PaymentViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/24.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define BTN_H 50
#import "PaymentViewController.h"

@interface PaymentViewController ()
@property (strong, nonatomic) UIButton *payBtn;
@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavgationBar];
    self.view.backgroundColor = RGBCOLOR(243, 243, 243);
    // Do any additional setup after loading the view from its nib.
}
- (void)initNavgationBar{
    [self addTitleViewWithTitle:@"选择支付方式"];
    [self.payBtn setTintColor:[UIColor clearColor]];
}
- (UIButton *)payBtn{
    if (!_payBtn) {
        _payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _payBtn.backgroundColor = RGBCOLOR(0,160,234);
        _payBtn.frame = CGRectMake(0, HEIGHT - BTN_H, WIDTH, BTN_H);
        [_payBtn setTitle:@"确定" forState:UIControlStateNormal];
        _payBtn.userInteractionEnabled = YES;
        [_payBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_payBtn];
    }
    return _payBtn;
}
- (void)BtnClick:(UIButton *)btn{
    [self showMessageTitle:@"支付成功"];
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
