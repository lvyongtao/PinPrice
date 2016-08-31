//
//  QueryheadView.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#define HEADVIEW_HEIGHT 72
#import "QueryheadView.h"

@interface QueryheadView ()

@property (strong, nonatomic) UIImageView *iconView;
@property (strong, nonatomic) UILabel *expressLable;
@property (strong, nonatomic) UILabel *orderIDLable;

@end

@implementation QueryheadView


- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.contentMode = UIViewContentModeScaleAspectFill;
        _iconView.backgroundColor = [UIColor clearColor];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = HEADVIEW_HEIGHT/2 - 10/2;
        _iconView.layer.masksToBounds = YES;
        [self addSubview:_iconView];
    }
    return _iconView;
}
- (UILabel *)expressLable{
    if (!_expressLable) {
        _expressLable = [[UILabel alloc] init];
        _expressLable.backgroundColor = [UIColor clearColor];//0.07
        _expressLable.textColor = [UIColor lightGrayColor];
        _expressLable.textAlignment = NSTextAlignmentLeft;
        _expressLable.font = [UIFont systemFontOfSize:15];
        [self addSubview:_expressLable];
    }
    return _expressLable;
}
- (UILabel *)orderIDLable{
    if (!_orderIDLable) {
        _orderIDLable = [[UILabel alloc] init];
        _orderIDLable.backgroundColor = [UIColor clearColor];//0.07
        _orderIDLable.textColor = [UIColor lightGrayColor];
        _orderIDLable.textAlignment = NSTextAlignmentLeft;
        _orderIDLable.font = [UIFont systemFontOfSize:15];
        [self addSubview:_orderIDLable];
    }
    return _orderIDLable;
}

- (void)setIconUrl:(NSString *)iconUrl{
    _iconUrl = iconUrl;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
}
- (void)setExpresstext:(NSString *)expresstext{
    _expresstext = expresstext;
    self.expressLable.text = expresstext;
}
- (void)setOrderIDtext:(NSString *)orderIDtext{
    _orderIDtext = orderIDtext;
    self.orderIDLable.text = orderIDtext;
}
- (void)layoutSubviews{

    __weak typeof(self) weakSelf = self;
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.width.height.offset(HEADVIEW_HEIGHT - 10);
    }];
    
    [self.expressLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconView.mas_top);
        make.left.equalTo(_iconView.mas_right).offset(5);
        make.width.offset(self.width - HEADVIEW_HEIGHT - 5);
        make.height.offset(HEADVIEW_HEIGHT/2 - 10/2);
    }];
    
    [self.orderIDLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_expressLable.mas_bottom);
        make.left.equalTo(_iconView.mas_right).offset(5);
        make.width.offset(self.width - HEADVIEW_HEIGHT - 5);
        make.height.offset(HEADVIEW_HEIGHT/2 - 10/2);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
