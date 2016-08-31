//
//  MineHeadView.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/17.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "MineHeadView.h"

@interface MineHeadView ()

@property (strong, nonatomic) UIImageView *iconView;

@property (strong, nonatomic) UILabel *nameLable;

@end

@implementation MineHeadView
- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.contentMode = UIViewContentModeScaleAspectFill;
        _iconView.backgroundColor = [UIColor clearColor];
        _iconView.clipsToBounds = YES;
        [self addSubview:_iconView];
    }
    return _iconView;
}
- (UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [[UILabel alloc] init];
        _nameLable.backgroundColor = [UIColor clearColor];//0.07
        _nameLable.textColor = [UIColor blackColor];
        _nameLable.textAlignment = NSTextAlignmentCenter;
        _nameLable.font = [UIFont systemFontOfSize:15];
        [self addSubview:_nameLable];
    }
    return _nameLable;
}
- (void)setIconUrl:(NSString *)iconUrl{
    _iconUrl = iconUrl;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
}
- (void)setNametext:(NSString *)nametext{
    _nametext = nametext;
    self.nameLable.text = nametext;
}
- (void)layoutSubviews{
    
    __weak typeof(self) weakSelf = self;
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(0.044*HEIGHT);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.width.height.offset(0.2*WIDTH);
    }];
    
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconView.mas_bottom).offset(5);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.width.offset(weakSelf.width*2/3);
        make.height.offset(0.079*WIDTH);
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
