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

//@property (strong, nonatomic) PlaceOrderModel *model;

@end

@implementation BuyGoodsViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationController.delegate = nil;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavgationBar];
    [self initBuyViewWith:nil];

    // Do any additional setup after loading the view.
}

- (void)initNavgationBar{
    
    [self addTitleViewWithTitle:@"订单"];
    if (self.type != 0) {
       [self addLeftBtnWithTitle:nil withImage:[UIImage imageNamed:@"all_backblue"] WithTitleColor:[UIColor blackColor] withTarget:self withMethod:@selector(backBtn)];
    }
    [self.orderBtn setTintColor:[UIColor clearColor]];
}
- (void)backBtn{
    PinTabBarController *tabBar=[[PinTabBarController alloc] init];
    tabBar.selectedIndex=2;
    tabBar.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    tabBar.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:tabBar animated:YES completion:nil];
}
//- (void)initxibView{
//    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"BuyGoodsView" owner:nil options:nil];
//    self.xibView = [views firstObject];
//    self.xibView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
//    [self.view addSubview:self.xibView];
//}
- (void)initBuyViewWith:(AddressModel *)addressModel{
    
    self.model.descname = @"size L";
    self.model.postage = @"10.00";
    self.model.ordernum = @"4692 3556 5673 6843";
    self.model.address = @"河南省\n朝阳区\n来广营幸福家园三层3318室";
    self.model.phone = @"18272917285";
    self.model.username = @"吕永涛";
    if (addressModel != nil) {
        self.model.address = [addressModel.address stringByAppendingString:addressModel.detailaddress];
        self.model.phone = addressModel.phone;
        self.model.username = addressModel.name;
    }
    self.buyView.model = self.model;
}
- (PlaceOrderModel *)model{
    if (!_model) {
        _model = [[PlaceOrderModel alloc] init];
    }
    return _model;
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
