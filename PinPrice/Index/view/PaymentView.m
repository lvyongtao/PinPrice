//
//  PaymentView.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/29.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "PaymentView.h"

@interface PaymentTypeView ()

@property (strong, nonatomic) UIButton *payTypeBtn;

@property (strong, nonatomic) UIView *singleLine;

@property (strong, nonatomic) UIImageView *imageSelected;

@end


@implementation PaymentTypeView


- (UIButton *)payTypeBtn{
    if (!_payTypeBtn) {
        _payTypeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _payTypeBtn.backgroundColor = [UIColor clearColor];
        _payTypeBtn.tag = 1;
        [_payTypeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _payTypeBtn.userInteractionEnabled = YES;
        [_payTypeBtn addTarget:self action:@selector(addAddressBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_payTypeBtn];
    }
    return _payTypeBtn;
}

- (UIImageView *)imageSelected{
    if (!_imageSelected) {
        _imageSelected = [[UIImageView alloc] init];
        _imageSelected.backgroundColor = [UIColor redColor];
    }
    return _imageSelected;
}

- (void)addAddressBtnClick:(UIButton *)btn{
    
}
@end

@implementation PaymentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
