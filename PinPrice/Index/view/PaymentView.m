//
//  PaymentView.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/29.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define CELL_H 53
#import "PaymentView.h"

@interface PaymentTypeView ()

@property (strong, nonatomic) UILabel *payTypeLable;

@property (strong, nonatomic) UIView *singleLine;

@property (strong, nonatomic) UIImageView *imageSelected;

@end


@implementation PaymentTypeView


- (UILabel *)payTypeLable{
    if (!_payTypeLable) {
        _payTypeLable = [[UILabel alloc] init];
        _payTypeLable.backgroundColor = [UIColor clearColor];//0.07
        _payTypeLable.textColor = RGBCOLOR(78, 103, 146);
        _payTypeLable.textAlignment = NSTextAlignmentLeft;
        _payTypeLable.font = [UIFont systemFontOfSize:17];
        _payTypeLable.text = self.payTypeTitle;
        [self addSubview:_payTypeLable];
    }
    return _payTypeLable;
}

- (UIImageView *)imageSelected{
    if (!_imageSelected) {
        _imageSelected = [[UIImageView alloc] init];
        [_imageSelected setImage:[UIImage imageNamed:@"payType_selected"]];
        _imageSelected.hidden = YES;
        _imageSelected.backgroundColor = [UIColor clearColor];
        [self addSubview:_imageSelected];
    }
    return _imageSelected;
}
- (UIView *)singleLine{
    if (!_singleLine) {
        _singleLine = [[UIView alloc] init];
        _singleLine.backgroundColor =RGBCOLOR(170, 170, 170);
        [self addSubview:_singleLine];
    }
    return _singleLine;
}

- (void)hiddenImage:(BOOL)hidden{
    self.imageSelected.hidden = hidden;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;;
    [self.imageSelected mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(8);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.width.height.offset(20);
    }];
    [self.payTypeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageSelected.mas_right).offset(10);
        make.top.bottom.right.equalTo(weakSelf);
    }];
    [self.singleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.mas_bottom).offset(- 1);
        make.width.offset(weakSelf.width);
        make.height.offset(1);
        make.left.equalTo(weakSelf);
    }];
    
}

@end
@interface PaymentView ()

@property (strong, nonatomic) UILabel *paymentLable;


@property (strong, nonatomic) PaymentTypeView *weixinView;
@property (strong, nonatomic) PaymentTypeView *alipayView;

@end
@implementation PaymentView
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [self.paymentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left).offset(8);
        make.height.offset(CELL_H);
        make.width.offset(WIDTH/4);
    }];
    
    [self.weixinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_paymentLable.mas_top);
        make.left.equalTo(_paymentLable.mas_right).offset(8);
        make.right.equalTo(weakSelf.mas_right);
        make.height.offset(CELL_H);
    }];
    
    [self.alipayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_weixinView.mas_bottom);
        make.left.equalTo(_weixinView.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.offset(CELL_H);
    }];
}

- (UILabel *)paymentLable{
    if (!_paymentLable) {
        _paymentLable = [[UILabel alloc] init];
        _paymentLable.backgroundColor = [UIColor clearColor];//0.07
        _paymentLable.textColor = [UIColor blackColor];
        _paymentLable.textAlignment = NSTextAlignmentCenter;
        _paymentLable.font = [UIFont systemFontOfSize:16];
        _paymentLable.text = self.paymentTitle;
        
        [self addSubview:_paymentLable];
    }
   return  _paymentLable;
}
- (PaymentTypeView *)weixinView{
    if (!_weixinView) {
        _weixinView = [[PaymentTypeView alloc] init];
        _weixinView.backgroundColor = [UIColor clearColor];
        [_weixinView addTarget:self action:@selector(PaymentTypeBtnclick:) forControlEvents:UIControlEventTouchUpInside];
        _weixinView.tag = 0;
        _weixinView.payTypeTitle = @"微信";
        [self addSubview:_weixinView];
    }
    return _weixinView;
}

- (PaymentTypeView *)alipayView{
    if (!_alipayView) {
        _alipayView = [[PaymentTypeView alloc] init];
        _alipayView.backgroundColor = [UIColor clearColor];
        [_alipayView addTarget:self action:@selector(PaymentTypeBtnclick:) forControlEvents:UIControlEventTouchUpInside];
        _alipayView.tag = 1;
        _alipayView.payTypeTitle = @"支付宝";
        [self addSubview:_alipayView];
    }
    return _alipayView;
}
- (void)PaymentTypeBtnclick:(PaymentTypeView *)btn{

    switch (btn.tag) {
        case 0:
            btn.selected = !btn.selected;
            if (btn.selected) {
                [_weixinView hiddenImage:NO];[_alipayView hiddenImage:YES];
                self.type = PaymentViewClickTypeWeixin;
                _alipayView.selected = NO;
            }else{
                [_weixinView hiddenImage:YES];
                self.type = PaymentViewClickTypeNone;
                _alipayView.selected = YES;
                //                            NSLog(@"点击微信隐藏");
            }
            break;
            
        case 1:
            btn.selected = !btn.selected;
            if (btn.selected) {
                [_alipayView hiddenImage:NO];[_weixinView hiddenImage:YES];
                self.type = PaymentViewClickTypeAliPay;
                _weixinView.selected = NO;
            }else{
                [_alipayView hiddenImage:YES];
                self.type = PaymentViewClickTypeNone;
                _weixinView.selected = YES;
                //                            NSLog(@"点击微信隐藏");
            }
            break;
            
        default:
            break;
    }
    
    if ([_delegate respondsToSelector:@selector(PaymentViewClickType:)]) {
        [_delegate PaymentViewClickType:self.type];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
