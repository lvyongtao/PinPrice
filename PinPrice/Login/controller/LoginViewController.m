//
//  LoginViewController.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/15.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "ThirdLoginView.h"
#import "RegisterViewController.h"
#import "PinTabBarController.h"


@interface LoginViewController ()<ThirdLoginBtnClickDelegate,UserLoginBtnClickDelegate,UsertextFiledClickDelegate>


@property (strong, nonatomic) UIImageView *loginBgView;

@property (strong, nonatomic) LoginView *loginView;

@property (strong, nonatomic) ThirdLoginView *thirdLoginView;

@end

@implementation LoginViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}
#pragma mark --init
- (void)initView{
    self.loginBgView.backgroundColor = [UIColor redColor];
    self.loginView.backgroundColor = [UIColor clearColor];
    self.thirdLoginView.backgroundColor = [UIColor clearColor];
}
- (UIImageView *)loginBgView{
    if (!_loginBgView) {
        _loginBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT*0.35)];
//        _loginBgView.backgroundColor = [UIColor clearColor];
        _loginBgView.contentMode = UIViewContentModeScaleAspectFill;
        _loginBgView.clipsToBounds = YES;
        _loginBgView.image = [UIImage imageNamed:@"login_bgImage"];
        [self.view addSubview:_loginBgView];
    }
    return _loginBgView;
}

- (LoginView *)loginView{
    if (!_loginView) {
        _loginView = [[LoginView alloc] init];
        _loginView.frame =CGRectMake(0.14*WIDTH, _loginBgView.height + 5, WIDTH - WIDTH*0.28,0.38*HEIGHT);
        _loginView.userView.delegate = self;
        _loginView.passordView.delegate = self;
        _loginView.delegate = self;
//        _loginView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_loginView];
    }
    return _loginView;
}

- (ThirdLoginView *)thirdLoginView{
    if (!_thirdLoginView) {
        _thirdLoginView = [[ThirdLoginView alloc] init];
        _thirdLoginView.frame =CGRectMake(0.12*WIDTH, _loginView.height + _loginView.y, WIDTH - WIDTH*0.24,0.27*HEIGHT);
        _thirdLoginView.delegate = self;
//        _thirdLoginView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_thirdLoginView];
    }
    return _thirdLoginView;
}
#pragma mark --ThirdLoginBtnClickDelegate
//ThirdLoginBtnClickDelegate
- (void)thirdLoginTypeClick:(ThirdLoginType)type{
    switch (type) {
        case ThirdLoginTypeWeibo:
            
            break;
        case ThirdLoginTypeQQ:
            
            break;
        case ThirdLoginTypeWeixin:
            
            break;
            
        default:
            break;
    }
    NSLog(@"%zi",type);
}
#pragma mark --UserLoginBtnClickDelegate
- (void)loginBtnClick:(NSInteger)btntTag{
    switch (btntTag) {
        case 102:
            [self actionLogin];
            break;
        case 103:
            [self actionRegister];
            break;
            
        default:
            break;
    }
}
#pragma mark --UsertextFiledClickDelegate
- (void)usertextFiledClickTag:(NSInteger)textFiledTag Text:(NSString *)text{
    NSLog(@"输入的信息 是--->%zi：---->%@",textFiledTag,text);
    switch (textFiledTag) {
        case 100:
            [PinUserInfo setphone:text];
            break;
        case 101:
            [PinUserInfo setpassword:text];
            break;
            
        default:
            break;
    }
}
#pragma mark --Action
- (void)actionLogin{
    [PinUserInfo setUserID:@"临时的ID类型"];
    if ([PinUserInfo getphone].length == 0) {
        [self showMessageTitle:@"请输入帐号"];
        return;
    }
    if ([PinUserInfo getpassword].length == 0) {
        [self showMessageTitle:@"请输入密码"];
        return;
    }
    if ([[PinUserInfo getphone] isEqualToString:@"18272917285"] && [[PinUserInfo getpassword] isEqualToString:@"12345678"]) {
        PinTabBarController *pinTabbar = [[PinTabBarController alloc] init];
        [self presentViewController:pinTabbar animated:YES completion:^{
            
        }];
    }else{[self showMessageTitle:@"账号密码不正确，请重新输入"];};
    NSLog(@"登录");
}

- (void)actionRegister{
    NSLog(@"注册");
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
