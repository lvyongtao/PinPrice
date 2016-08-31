//
//  RegisterViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/16.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginView.h"

@interface RegisterViewController ()<UserBtnClickDelegate>
/**
 *  手机号，验证码，输入验证码视图
 */
@property (strong, nonatomic) UserAccountView *phoneView;
@property (strong, nonatomic) UserAccountView *codeView;
@property (strong, nonatomic) UserAccountView *codeInputView;
/**
 *  注册
 */
@property (strong, nonatomic) UIButton *enterBtn;

@end

@implementation RegisterViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavgationUI];
    
    // Do any additional setup after loading the view.
}
#pragma mark --init
- (void)initNavgationUI{
    [self addTitleViewWithTitle:@"手机快速注册"];
    [self initView];
//    [self addLeftBtnWithTitle:nil withImage:[UIImage imageNamed:@"all_back"] WithTitleColor:[UIColor blackColor] withTarget:self withMethod:@selector(backBtnclick)];
}
- (void)backBtnclick{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)initView{
    self.phoneView.backgroundColor = [UIColor clearColor];
    self.codeView.backgroundColor = [UIColor clearColor];
    self.codeInputView.backgroundColor = [UIColor clearColor];
    __weak typeof(self) weakSelf = self;
    [self.enterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_codeInputView.mas_bottom).offset(0.08*HEIGHT);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.width.offset(0.7*WIDTH);
        make.height.offset(0.07*HEIGHT);
    }];
}
#pragma mark --lazyload
- (UserAccountView *)phoneView{
    if (!_phoneView) {
        _phoneView = [[UserAccountView alloc] init];
        _phoneView.frame =CGRectMake(0.14*WIDTH, 15 + NavH, WIDTH - WIDTH*0.28,0.086*HEIGHT);
        _phoneView.text = @"+86";
        _phoneView.placeholder = @"输入手机号";
        _phoneView.tag = 110;
        _phoneView.textField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneView.isShowTextFiled = YES;
        _phoneView.isShowLable = YES;
        [self.view addSubview:_phoneView];
    }
    return _phoneView;
}
- (UserAccountView *)codeView{
    if (!_codeView) {
        _codeView = [[UserAccountView alloc] init];
        _codeView.frame =CGRectMake(0.14*WIDTH, 15 + _phoneView.y + _phoneView.height, WIDTH - WIDTH*0.28,0.086*HEIGHT);
        _codeView.text = @"验证码";
        _codeView.tag = 111;
        _codeView.btnDelegate = self;
        _codeView.textField.keyboardType = UIKeyboardTypeNumberPad;
        _codeView.isShowLable = YES;
        _codeView.isShowBtn = YES;
        [self.view addSubview:_codeView];
    }
    return _phoneView;
}
- (UserAccountView *)codeInputView{
    if (!_codeInputView) {
        _codeInputView = [[UserAccountView alloc] init];
        _codeInputView.frame =CGRectMake(0.14*WIDTH, 15 + _codeView.y + _codeView.height, WIDTH - WIDTH*0.28,0.086*HEIGHT);
        _codeInputView.text = @"输入验证码";
        _codeInputView.tag = 112;
        _codeInputView.textField.keyboardType = UIKeyboardTypeNumberPad;
        _codeInputView.isShowLable = YES;
        _codeInputView.isShowTextFiled = YES;
        [self.view addSubview:_codeInputView];
    }
    return _phoneView;
}
- (UIButton *)enterBtn{
    if (!_enterBtn) {
        _enterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _enterBtn.backgroundColor = RGBCOLOR(0, 158, 237);
        [_enterBtn setTitle:@"登录" forState:UIControlStateNormal];
        _enterBtn.userInteractionEnabled = YES;
        [_enterBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_enterBtn];
    }
    return _enterBtn;
}
#pragma mark --action
// 发送验证码
- (void)userBtnClickTag:(NSInteger)tag{
    NSLog(@"点击了发送验证码");
}
// 点击登录按钮
- (void)btnClick:(UIButton *)btn{
    NSLog(@"点击了登录按钮");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
