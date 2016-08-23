//
//  ThirdLoginView.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/15.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "ThirdLoginView.h"

@interface ThirdLoginView ()

@property (strong, nonatomic) UILabel *titleLable;
@property (strong, nonatomic) UIView *singleLine;

@end

@implementation ThirdLoginView
- (instancetype)init{
    if (self = [super init]) {
        [self viewdidload];
    }
    return self;
}
- (void)viewdidload{
    
    _titleLable = [[UILabel alloc] init];
    _titleLable.backgroundColor = [UIColor clearColor];//0.07
    _titleLable.textColor = RGBCOLOR(145,148,154);
    _titleLable.textAlignment = NSTextAlignmentCenter;
    _titleLable.font = [UIFont systemFontOfSize:11];
    [self addSubview:_titleLable];
    
    _singleLine = [[UIView alloc] init];
    _singleLine.backgroundColor = [UIColor grayColor];
    [self addSubview:_singleLine];
    
    NSArray *imageNames = @[@"weibo@2x",@"qq@2x",@"weixin@2x"];
    for (int i = 0; i < 3; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 100 + i;
        btn.userInteractionEnabled = YES;
        btn.backgroundColor = [UIColor clearColor];
        [btn setImage:[UIImage imageNamed:imageNames[i]] forState:UIControlStateNormal];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
}
- (void)btnClick:(UIButton *)btn{
    
    if ([self.delegate respondsToSelector:@selector(thirdLoginTypeClick:)]) {
        switch (btn.tag) {
            case 100:
                [self.delegate thirdLoginTypeClick:ThirdLoginTypeWeibo];
                break;
            case 101:
                 [self.delegate thirdLoginTypeClick:ThirdLoginTypeQQ];
                break;
            case 102:
                 [self.delegate thirdLoginTypeClick:ThirdLoginTypeWeixin];
                break;
                
            default:
                break;
        }
    }
}


- (void)layoutSubviews{
    _titleLable.text = @"第三方登录";
    __weak typeof(self) weakSelf = self;
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(0.08*HEIGHT);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.width.offset(weakSelf.width);
        make.height.offset(0.02*HEIGHT);
    }];
    
    [_singleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLable.mas_bottom).offset(5);
        make.width.equalTo(weakSelf.mas_width);
        make.height.offset(1);
        make.left.equalTo(weakSelf.mas_left);
    }];

    for (int i = 0;i <3; i ++) {
        UIButton *btn = [self viewWithTag:100 + i];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_singleLine.mas_bottom).offset(5);
            make.left.equalTo(weakSelf.mas_left).offset(0.2*WIDTH + i*(10 + 0.09*WIDTH));
            make.width.offset(0.09*WIDTH);
            make.height.offset(0.045*HEIGHT);
        }];
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
