//
//  GoodDetaiView.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/23.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define BTN_H 72
#define ANGLE_W 180
//动画的宽度
#define ANIAMTIONIMAGE_W 20

#import "GoodDetaiView.h"
//(0,160,234)
@interface GoodDetaiView ()

@property (strong, nonatomic) UIImageView *goodsImage;
@property (strong, nonatomic) UILabel *goodsLable;
@property (strong, nonatomic) UILabel *priceLable;
@property (strong, nonatomic) UILabel *relatedLable;



@end

@implementation GoodDetaiView

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor yellowColor];
        [self viewdidload];
    }
    return self;
}

- (void)viewdidload{
    for (int i = 0; i < 3; i ++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 100 + i;
        btn.userInteractionEnabled = YES;
        if (i == 0 || i== 1) {
            [btn setImage:[UIImage imageNamed:@"white_line"] forState:UIControlStateNormal];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, WIDTH/3 - 3, 0, 0)];
        }
        btn.backgroundColor = RGBCOLOR(0,160,234);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}
- (UIImageView *)goodsImage{
    if (!_goodsImage) {
        _goodsImage = [[UIImageView alloc] init];
        _goodsImage.contentMode = UIViewContentModeScaleAspectFill;
        _goodsImage.backgroundColor = [UIColor clearColor];
        _goodsImage.clipsToBounds = YES;
        [self addSubview:_goodsImage];
    }
    return _goodsImage;
}
- (UIImageView *)animationImage{
    if (!_animationImage) {
        _animationImage = [[UIImageView alloc] init];
        //CGRectMake(WIDTH/2,0.78*(HEIGHT + 0.11*HEIGHT - NavH), 30, 30)
        _animationImage.backgroundColor =[UIColor redColor];
        [_animationImage.image circleImage];
        _animationImage.hidden = YES;
        [self addSubview:_animationImage];
    }
    return _animationImage;
}
- (UILabel *)goodsLable{
    if (!_goodsLable) {
        _goodsLable = [[UILabel alloc] init];
        _goodsLable.backgroundColor = RGBCOLOR(88, 89, 90);//0.07
        _goodsLable.alpha = 0.7;
        _goodsLable.textColor = [UIColor whiteColor];
        _goodsLable.textAlignment = NSTextAlignmentLeft;
        _goodsLable.font = [UIFont systemFontOfSize:15];
        
        [_goodsImage addSubview:_goodsLable];
    }
    return _goodsLable;
}
- (UILabel *)priceLable{
    if (!_priceLable) {
        _priceLable = [[UILabel alloc] init];
        _priceLable.backgroundColor = RGBCOLOR(88, 89, 90);//0.07
        _priceLable.alpha = 0.7;
        _priceLable.textColor = [UIColor whiteColor];
        _priceLable.textAlignment = NSTextAlignmentRight;
        _priceLable.font = [UIFont systemFontOfSize:15];
        
        [_goodsImage addSubview:_priceLable];
    }
    return _priceLable;
}
- (UILabel *)relatedLable{
    if (!_relatedLable) {
        _relatedLable = [[UILabel alloc] init];
        _relatedLable.backgroundColor = RGBCOLOR(69, 69, 69);//0.07
        _relatedLable.textColor = [UIColor whiteColor];
        _relatedLable.textAlignment = NSTextAlignmentCenter;
        _relatedLable.font = [UIFont systemFontOfSize:15];
        
        [self addSubview:_relatedLable];
    }
    return _relatedLable;
}
- (void)btnClick:(UIButton *)btn{
    switch (btn.tag) {
        case 100:
            self.type = BtnActionTypeBuy;
            break;
        case 101:
            self.type = BtnActionTypeCart;
            break;
        case 102:
            self.type = BtnActionTypeDetail;
            break;
            
        default:
            break;
    }
    if ([self.delegate respondsToSelector:@selector(GoodDetaiViewBtnAction:)]) {
        [self.delegate GoodDetaiViewBtnAction:self.type];
    }
}
- (void)setModel:(DetailGoodsModel *)model{
    _model = model;
    [self.goodsImage sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
    if (self.model.goodsname) {
        self.goodsLable.text = [NSString stringWithFormat:@"  %@",model.goodsname];
    }
    if (self.model.goodsprice) {
        self.priceLable.text = [NSString stringWithFormat:@"¥%@",model.goodsprice];
    }
    [self.animationImage sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.reloatedText) {
        self.relatedLable.text = self.reloatedText;
    }
    self.goodsImage.frame = CGRectMake(0, 0, self.width, HEIGHT - 0.11*self.height - NavH);
    
    self.goodsLable.frame = CGRectMake(0, self.goodsImage.height - 0.088*self.height, self.width/2, 0.088*self.height);
    
    self.priceLable.frame = CGRectMake(self.width/2, self.goodsImage.height - 0.088*self.height, self.width/2, 0.088*self.height);
    
    self.relatedLable.frame = CGRectMake(0, self.goodsImage.height +0.11*self.height, self.width, 0.11*HEIGHT);
    
    for (int i = 0;i < 3; i ++) {
        UIButton *btn = [self viewWithTag:100 + i];
        btn.frame = CGRectMake(i*self.width/3, self.goodsImage.height,self.width/3, 0.11*self.height);
        [btn setTitle:self.btnTitles[i] forState:UIControlStateNormal];
    }
    
    self.animationImage.frame = CGRectMake(self.width/3 + (self.width/3 - ANIAMTIONIMAGE_W)/2, self.goodsImage.height - ANIAMTIONIMAGE_W, ANIAMTIONIMAGE_W, ANIAMTIONIMAGE_W);
}
- (void)resetAnimaitonImage{
    self.animationImage.hidden = YES;
    self.animationImage.alpha = 1.0;
    self.animationImage.frame = CGRectMake(self.width/3 + (self.width/3 - ANIAMTIONIMAGE_W)/2, self.goodsImage.height - ANIAMTIONIMAGE_W, ANIAMTIONIMAGE_W, ANIAMTIONIMAGE_W);
}
- (void)startAnimationImage{
    self.animationImage.hidden = NO;
    self.animationImage.alpha = 0.1;
    self.animationImage.frame = CGRectMake(WIDTH - 40, 0, ANIAMTIONIMAGE_W, ANIAMTIONIMAGE_W);
//    self.animationImage.transform = CGAffineTransformMakeScale(0.5, 0.5);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
