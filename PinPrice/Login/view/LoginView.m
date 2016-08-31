//
//  LoginView.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/15.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "LoginView.h"

@interface UserAccountView ()

@property (strong, nonatomic) UIImageView *iconImage;
@property (strong, nonatomic) UIButton *codeBtn;
//title
@property (strong, nonatomic) UILabel *headLable;
@property (strong, nonatomic) UIView *singleLine;

@end

@implementation UserAccountView
- (instancetype)init{
    if (self = [super init]) {
        
        
        self.singleLine.backgroundColor = [UIColor grayColor];
    }
    return self;
}
#pragma mark --lazyload
- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] init];
        _iconImage.contentMode = UIViewContentModeScaleAspectFit;
        _iconImage.backgroundColor = [UIColor clearColor];
        _iconImage.clipsToBounds = YES;
        [self addSubview:_iconImage];
    }
    return _iconImage;
}
- (UIView *)singleLine{
    if (!_singleLine) {
        _singleLine = [[UIView alloc] init];
        _singleLine.backgroundColor = [UIColor grayColor];
        [self addSubview:_singleLine];
    }
    return _singleLine;
}
- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.backgroundColor = [UIColor clearColor];
        _textField.textAlignment = NSTextAlignmentLeft;
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.tag = self.tag;
        _textField.delegate = self;
        [self addSubview:_textField];
    }
    return _textField;
}
- (UIButton *)codeBtn{
    if (!_codeBtn) {
        _codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _codeBtn.tag = self.tag;
        _codeBtn.backgroundColor = [UIColor clearColor];
        [_codeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        [_codeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _codeBtn.userInteractionEnabled = YES;
        [_codeBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_codeBtn];
    }
    return _codeBtn;
}
- (UILabel *)headLable{
    if (!_headLable) {
        _headLable = [[UILabel alloc] init];
        _headLable.backgroundColor = [UIColor clearColor];//0.07
        _headLable.textColor = [UIColor blackColor];
        _headLable.text = self.text;
        _headLable.textAlignment = NSTextAlignmentLeft;
        _headLable.font = [UIFont systemFontOfSize:15];
        [self addSubview:_headLable];
    }
    return _headLable;
}

- (void)btnClick:(UIButton *)btn{
    if ([self.btnDelegate respondsToSelector:@selector(userBtnClickTag:)]) {
        [self.btnDelegate userBtnClickTag:btn.tag];
    }else{
        
    }
}
- (void)layoutSubviews{
    

    //W39 H36
    __weak typeof(self) weakSelf = self;
    if (_isShowIcon&& _isShowTextFiled&& !_isShowBtn && !_isShowLable) {
        self.iconImage.image = [UIImage imageNamed:self.iconName];
        self.textField.placeholder =self.placeholder;
        [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(weakSelf.mas_centerY);
            make.width.offset(0.06*WIDTH);
            make.height.offset(0.03*HEIGHT);
            make.left.equalTo(weakSelf.mas_left);
        }];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_top);
            make.left.equalTo(_iconImage.mas_right).offset(self.width *0.05);
            make.bottom.equalTo(weakSelf.mas_bottom);
            make.right.equalTo(weakSelf.mas_right);
        }];
    }
    if (_isShowLable&& _isShowBtn&& !_isShowTextFiled && !_isShowIcon) {
        [self.headLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(weakSelf.mas_centerY);
            make.width.offset(self.width/2);
            make.height.offset(0.03*HEIGHT);
            make.left.equalTo(weakSelf.mas_left);
        }];
        [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_top);
            make.left.equalTo(_headLable.mas_right).offset(self.width *0.05);
            make.bottom.equalTo(weakSelf.mas_bottom);
            make.right.equalTo(weakSelf.mas_right);
        }];
    }
    
    if (_isShowLable&& _isShowTextFiled&& !_isShowIcon && !_isShowBtn) {
        self.textField.placeholder =self.placeholder;
        CGSize size = [PinMethod sizeWithString:self.text fount:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(self.width/2, 0.03*HEIGHT)];
        [self.headLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(weakSelf.mas_centerY);
            make.width.offset(size.width + 1);
            make.height.offset(0.03*HEIGHT);
            make.left.equalTo(weakSelf.mas_left);
        }];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.mas_top);
            make.left.equalTo(_headLable.mas_right).offset(self.width *0.05);
            make.bottom.equalTo(weakSelf.mas_bottom);
            make.right.equalTo(weakSelf.mas_right);
        }];
    }
    
    _singleLine.frame = CGRectMake(0,self.height - 1, self.width, 1);
}
#pragma mark --delegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSInteger existedLength = textField.text.length;
    NSInteger selectedLength = range.length;
    NSInteger replaceLength = string.length;
    if (string.length == 0) return YES;
    
    switch (self.tag) {
        case 100:
            if (existedLength - selectedLength + replaceLength > 11){return NO;}
            break;
        case 101:
            if (existedLength - selectedLength + replaceLength > 8){return NO;}
            break;
        case 110:
            if (existedLength - selectedLength + replaceLength > 11){return NO;}
            break;
        case 111:
            if (existedLength - selectedLength + replaceLength > 4){return NO;}
            break;
            
        default:
            break;
    }
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    if ([self.delegate respondsToSelector:@selector(newUserInfoTetxFiledClick:)]) {
//        [self.delegate newUserInfoTetxFiledClick:self.tag];
//    }
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [self.textField resignFirstResponder];
    if ([self.delegate respondsToSelector:@selector(usertextFiledClickTag:Text:)]) {
        [self.delegate usertextFiledClickTag:self.textField.tag Text:self.textField.text];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textField resignFirstResponder];
    return YES;
}

@end
@interface LoginView ()

@property (strong, nonatomic) UIButton *RegisterBtn;

@end
@implementation LoginView
- (instancetype)init{
    if (self = [super init]) {
        [self viewdidload];
    }
    return self;
}

- (void)viewdidload{
    
    _userView = [[UserAccountView alloc] init];
    _userView.backgroundColor = [UIColor clearColor];
    [self addSubview:_userView];
    _userView.tag = 100;
    _userView.isShowIcon = YES;
    _userView.isShowTextFiled = YES;
    _userView.textField.keyboardType = UIKeyboardTypeNumberPad;
    _userView.placeholder = @"输入手机号";
    _userView.iconName = @"Rectangle";
    
    _passordView = [[UserAccountView alloc] init];
    _passordView.backgroundColor = [UIColor clearColor];
    [self addSubview:_passordView];
    _passordView.tag = 101;
    _passordView.isShowIcon = YES;
    _passordView.isShowTextFiled = YES;
    _passordView.textField.keyboardType = UIKeyboardTypeDefault;
    _passordView.textField.secureTextEntry = YES;
    _passordView.placeholder = @"密码";
    _passordView.iconName = @"lock-icon";
    
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginBtn.tag = 102;
    _loginBtn.backgroundColor = RGBCOLOR(0, 158, 237);
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    _loginBtn.userInteractionEnabled = YES;
    [_loginBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_loginBtn];
    
    _RegisterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _RegisterBtn.tag = 103;
    _RegisterBtn.userInteractionEnabled = YES;
    _RegisterBtn.backgroundColor = [UIColor clearColor];
    [_RegisterBtn setAttributedTitle:[self AttributedStringWithString1:@"没有账号？" String2:@"点击注册"] forState:UIControlStateNormal];
    _RegisterBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_RegisterBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_RegisterBtn];
    
}
- (void)layoutSubviews{
    _userView.frame = CGRectMake(0, 0, self.width, 0.1*HEIGHT);
    _passordView.frame = CGRectMake(0, _userView.height + _userView.y, self.width,  0.1*HEIGHT);
    _loginBtn.frame = CGRectMake(0, 0.07*HEIGHT + _passordView.y +_passordView.height, self.width, 0.07*HEIGHT);
    _RegisterBtn.frame = CGRectMake(0, _loginBtn.y + _loginBtn.height + 10, self.width/2, 0.02*HEIGHT);
}
- (void)btnClick:(UIButton *)btn{
    
    if ([self.delegate respondsToSelector:@selector(loginBtnClick:)]) {
        [self.delegate loginBtnClick:btn.tag];
    }
    
}
- (NSAttributedString *)AttributedStringWithString1:(NSString *)string1 String2:(NSString *)string2{
    // 下划线
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *atttibuteStr = [[NSMutableAttributedString alloc] initWithString:string2 attributes:attribtDic];
    NSDictionary *attribtDic1 = @{NSForegroundColorAttributeName:[UIColor grayColor]};
    NSMutableAttributedString *atttibuteStr1 = [[NSMutableAttributedString alloc] initWithString:string1 attributes:attribtDic1];
   [atttibuteStr1 appendAttributedString:atttibuteStr];
    
    return atttibuteStr1;
}
@end
