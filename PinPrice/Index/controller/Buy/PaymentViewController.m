//
//  PaymentViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/24.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define BTN_H 50
#define CELL_H 53
#import "PaymentViewController.h"
#import "PaymentView.h"


@interface PaymentViewController ()<PaymentViewClickDelegate>
@property (strong, nonatomic) UIButton *payBtn;

@property (strong, nonatomic) PaymentView *payView;
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
    [self.payView setFrame:CGRectMake(0, NavH + 10, WIDTH, CELL_H*2 + 10)];
}
#pragma mark --lazyload
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
- (PaymentView *)payView{
    if (!_payView) {
        _payView = [[PaymentView alloc] init];
        _payView.delegate = self;
        _payView.paymentTitle = @"支付方式";
        _payView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_payView];
    }
    return _payView;
}
#pragma mark --支付按钮事件
- (void)BtnClick:(UIButton *)btn{
    
    [self showMessageTitle:@"支付成功"];
}
#pragma mark --PaymentViewClickDelegate
- (void)PaymentViewClickType:(PaymentViewClickType)type{
    switch (type) {
        case PaymentViewClickTypeWeixin:
            [self showMessageTitle:@"微信支付"];
            break;
        case PaymentViewClickTypeAliPay:
            [self showMessageTitle:@"支付宝支付"];
            break;
        case PaymentViewClickTypeNone:
            [self showMessageTitle:@"请选择您的支付方式"];
            break;
            
        default:
            break;
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
