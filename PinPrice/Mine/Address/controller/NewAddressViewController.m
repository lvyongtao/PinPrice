//
//  NewAddressViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define BTN_H 50
#define NEWVIEW_H 50
#import "NewAddressViewController.h"
#import "NewAddressView.h"


@interface NewAddressViewController ()<NewAddressViewDelagete>
@property (strong, nonatomic) UIButton *SaveBtn;
@property (strong, nonatomic) NSArray *titleArr;

@end
@implementation NewAddressViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initNavgationBar];
    [self initNewAddressView];
}
- (void)initNavgationBar{
    [self addTitleViewWithTitle:@"新建地址"];
    [self.SaveBtn setTintColor:[UIColor clearColor]];
}
- (AddressModel *)model{
    if (!_model) {
        _model =[[AddressModel alloc] init];
    }
    return _model;
}
- (void)initNewAddressView{
    _titleArr = @[@"收货人",@"手机号码",@"所在地区",@"详细地址"];

    for (int i = 0; i < 4; i ++) {
        NewAddressView *view = [[NewAddressView alloc] init];
        view.delegate = self;
        view.tag = i;
        if (self.model) {
            switch (view.tag) {
                case 0:
                    view.detailText = self.model.name;
                    break;
                case 1:
                    view.detailText = self.model.phone;
                    break;
                case 2:
                    view.detailText = self.model.address;
                    break;
                case 3:
                    view.detailText = self.model.detailaddress;
                    break;
                default:
                    break;
            }
        }
        view.titleText = _titleArr[i];
        view.frame = CGRectMake(0, NavH + NEWVIEW_H*i, WIDTH, NEWVIEW_H);
        [self.view addSubview:view];
        
        
    }
}
#pragma mark --lazyload
- (UIButton *)SaveBtn{
    if (!_SaveBtn) {
        _SaveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _SaveBtn.backgroundColor = [UIColor grayColor];
        _SaveBtn.frame = CGRectMake(0, HEIGHT - BTN_H, WIDTH, BTN_H);
        [_SaveBtn setTitle:@"保存" forState:UIControlStateNormal];
        _SaveBtn.userInteractionEnabled = YES;
        [_SaveBtn addTarget:self action:@selector(SaveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_SaveBtn];
    }
    return _SaveBtn;
}
- (void)SaveBtnClick:(UIButton *)btn{
    if (!self.model.name || self.model.name.length ==0) {
        [self showMessageTitle:@"请填写您的收货人！"];
        return;
    }
    if (!self.model.phone || self.model.phone.length ==0) {
        [self showMessageTitle:@"请填写您的手机号码！"];
        return;
    }
    if (!self.model.address || self.model.address.length ==0) {
        [self showMessageTitle:@"请填写您的所在地区！"];
        return;
    }
    if (!self.model.detailaddress || self.model.detailaddress.length ==0) {
        [self showMessageTitle:@"请填写您的详细地址！"];
        return;
    }
    
    if (self.addressEdit) {
        self.addressEdit(self.model);
    }
    NSLog(@"保存%@",self.model);
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)returnAddressViewController:(AddressEditBlock)block{
    _addressEdit = block;
}
#pragma mark --NewAddressViewDelagete
- (void)NewAddressViewEndEditingText:(NSString *)text Index:(NSInteger)index{
    switch (index) {
        case 0:
            self.model.name = text;
            break;
        case 1:
            self.model.phone = text;
            break;
        case 2:
            self.model.address = text;
            break;
        case 3:
            self.model.detailaddress = text;
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
