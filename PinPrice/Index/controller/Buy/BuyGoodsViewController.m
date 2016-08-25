//
//  BuyGoodsViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/23.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define BTN_H 50
#import "BuyGoodsViewController.h"
#import "BuyGoodsView.h"
#import "PaymentViewController.h"
#import "AddressViewController.h"
#import "AddressModel.h"

@interface BuyGoodsViewController ()<AddressMsgViewDelegate>

@property (strong, nonatomic) BuyGoodsView*buyView;

@property (strong, nonatomic) UIButton *orderBtn;

@property (strong, nonatomic) PlaceOrderModel *model;

@end

@implementation BuyGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavgationBar];
    [self initBuyViewWith:nil];
    
    
    // Do any additional setup after loading the view.
}
- (void)initNavgationBar{
    [self addTitleViewWithTitle:@"订单"];
    [self.orderBtn setTintColor:[UIColor clearColor]];
}
//- (void)initxibView{
//    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"BuyGoodsView" owner:nil options:nil];
//    self.xibView = [views firstObject];
//    self.xibView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
//    [self.view addSubview:self.xibView];
//}
- (void)initBuyViewWith:(AddressModel *)addressModel{
   PlaceOrderModel *model = [[PlaceOrderModel alloc] init];
    model.imageUrl = @"http://xqproduct.xiangqu.com/FiuVzSQ_tThGIGTKHA_fTlMX6QCe?imageView2/2/w/300/q/90/format/jpg/@w/$w$@/@h/$h$@/700x700/";
    model.name = @"晴天雨高档桌椅";
    model.descname = @"size L";
    model.price = @"600.00";
    model.postage = @"10.00";
    model.ordernum = @"4692 3556 5673 6843";
    model.address = @"河南省\n朝阳区\n来广营幸福家园三层3318室";
    model.phone = @"18272917285";
    model.username = @"吕永涛";
    if (addressModel != nil) {
        model.address = addressModel.address;
        model.phone = addressModel.phone;
        model.username = addressModel.name;
    }
    self.buyView.model = model;
}
- (BuyGoodsView *)buyView{
    if (!_buyView) {
        _buyView = [[BuyGoodsView alloc] init];
        _buyView.delegate = self;
        _buyView.backgroundColor = [UIColor clearColor];
        _buyView.frame = CGRectMake(0, NavH, WIDTH, HEIGHT - BTN_H - NavH);
        [self.view addSubview:_buyView];
    }
    return _buyView;
}
- (UIButton *)orderBtn{
    if (!_orderBtn) {
        _orderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _orderBtn.backgroundColor = RGBCOLOR(0,160,234);
        _orderBtn.frame = CGRectMake(0, HEIGHT - BTN_H, WIDTH, BTN_H);
        [_orderBtn setTitle:@"下订单" forState:UIControlStateNormal];
        _orderBtn.userInteractionEnabled = YES;
        [_orderBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_orderBtn];
    }
    return _orderBtn;
}
- (void)BtnClick:(UIButton *)btn{
    PaymentViewController *payment = [[PaymentViewController alloc] init];
    [self.navigationController pushViewController:payment animated:YES];
    NSLog(@"下订单");
}
- (void)changeAddressWithGestureRecognizer{
    AddressViewController *address = [[AddressViewController alloc] init];
    [address returnBuyGoodsViewController:^(AddressModel *model) {
        [self initBuyViewWith:model];
        NSLog(@"地址=%@, 姓名＝%@,手机号＝%@",model.address,model.name,model.phone);
    }];
    [self.navigationController pushViewController:address animated:YES];
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
