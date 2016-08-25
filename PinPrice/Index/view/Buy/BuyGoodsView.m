//
//  BuyGoodsView.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/24.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define BTN_H 50
#import "BuyGoodsView.h"
/***********商品信息*************/
@interface GoodsMsgView ()

@property (strong, nonatomic) UIImageView *imageHeadView;
@property (strong, nonatomic) UILabel *nameLable;
@property (strong, nonatomic) UILabel *descLable;
@property (strong, nonatomic) UILabel *priceLable;

@property (strong, nonatomic) UIView *singleLine;



@end
@implementation GoodsMsgView
- (UIImageView *)imageHeadView{
    if (!_imageHeadView) {
        _imageHeadView = [[UIImageView alloc] init];
        _imageHeadView.contentMode = UIViewContentModeScaleAspectFill;
        _imageHeadView.backgroundColor = [UIColor clearColor];
        _imageHeadView.clipsToBounds = YES;
        [_imageHeadView sd_setImageWithURL:[NSURL URLWithString:self.imageurl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
    
        [self addSubview:_imageHeadView];
    }
    return _imageHeadView;
}

- (UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [[UILabel alloc] init];
        _nameLable.backgroundColor = [UIColor clearColor];//0.07
        _nameLable.textColor = [UIColor blackColor];
        _nameLable.textAlignment = NSTextAlignmentLeft;
        _nameLable.font = [UIFont systemFontOfSize:18];
        _nameLable.text = self.name;

        [self addSubview:_nameLable];
    }
    return _nameLable;
}

- (UILabel *)descLable{
    if (!_descLable) {
        _descLable = [[UILabel alloc] init];
        _descLable.backgroundColor = [UIColor clearColor];//0.07
        _descLable.textColor = [UIColor grayColor];
        _descLable.numberOfLines = 0;
        _descLable.textAlignment = NSTextAlignmentLeft;
        _descLable.font = [UIFont systemFontOfSize:15];
        _descLable.text = self.descname;

        [self addSubview:_descLable];
    }
    return _descLable;
}

- (UILabel *)priceLable{
    if (!_priceLable) {
        _priceLable = [[UILabel alloc] init];
        _priceLable.backgroundColor = [UIColor clearColor];//0.07
        _priceLable.textColor = [UIColor blackColor];
        _priceLable.textAlignment = NSTextAlignmentRight;
        _priceLable.font = [UIFont systemFontOfSize:15];
        _priceLable.text = self.price;
        
        [self addSubview:_priceLable];
    }
    return _priceLable;
}
- (UIView *)singleLine{
    if (!_singleLine) {
        _singleLine = [[UIView alloc] init];
        _singleLine.backgroundColor =RGBCOLOR(170, 170, 170);
        [self addSubview:_singleLine];
    }
    return _singleLine;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [self.imageHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(0.14*weakSelf.height);
        make.left.equalTo(weakSelf.mas_left).offset(0.14*weakSelf.height);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(- 0.14*weakSelf.height);
        make.width.offset(weakSelf.height*0.72);
    }];
    
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageHeadView.mas_right).offset(5);
        make.top.equalTo(_imageHeadView.mas_top);
        make.right.equalTo(weakSelf.priceLable.mas_left).offset(- 5);
        make.bottom.equalTo(weakSelf.descLable.mas_top);
    }];
    
    [self.descLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLable.mas_bottom);
        make.left.equalTo(_nameLable.mas_left);
//        make.bottom.equalTo(weakSelf.mas_bottom).offset(- 5);
        make.right.equalTo(self.priceLable.mas_left);
    }];
    [self.priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageHeadView.mas_top);
        make.right.equalTo(weakSelf.mas_right).offset(- 0.14*weakSelf.height);
        make.left.equalTo(_nameLable.mas_right).offset(5);
//        make.bottom.equalTo(weakSelf.mas_bottom).offset(- 5);
    }];
    
    [self.singleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.width.left.equalTo(weakSelf);
        make.height.offset(1);
    }];
}



@end
/***********订单信息*************/
@interface OrderMsgView ()
@property (strong, nonatomic) UIView *singleLine;
@property (strong, nonatomic) UILabel *titleLable;
@property (strong, nonatomic) UILabel *detailLable;
@end
@implementation OrderMsgView

- (UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.backgroundColor = [UIColor clearColor];//0.07
        _titleLable.textColor = [UIColor blackColor];
        _titleLable.textAlignment = NSTextAlignmentLeft;
        _titleLable.text = self.title;
        _titleLable.font = [UIFont systemFontOfSize:17];
        [self addSubview:_titleLable];
    }
    return _titleLable;
}
- (UILabel *)detailLable{
    if (!_detailLable) {
        _detailLable = [[UILabel alloc] init];
        _detailLable.backgroundColor = [UIColor clearColor];//0.07
        _detailLable.textColor = [UIColor blackColor];
        _detailLable.textAlignment = NSTextAlignmentRight;
        _detailLable.text = self.detailtitile;
        _detailLable.font = [UIFont systemFontOfSize:17];
        [self addSubview:_detailLable];
    }
    return _detailLable;
}
- (UIView *)singleLine{
    if (!_singleLine) {
        _singleLine = [[UIView alloc] init];
        _singleLine.backgroundColor =RGBCOLOR(170, 170, 170);
        [self addSubview:_singleLine];
    }
    return _singleLine;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(weakSelf);
        make.right.equalTo(self.detailLable.mas_left).offset(- 5);
        make.left.equalTo(weakSelf.mas_left).offset(0.0226*(HEIGHT - BTN_H - NavH));
    }];
    
    [self.detailLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(weakSelf);
        make.right.equalTo(weakSelf.mas_right).offset(- 0.0532*(HEIGHT - BTN_H - NavH));
        make.left.equalTo(self.titleLable.mas_right).offset(5);
    }];
    
    [self.singleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.width.left.equalTo(weakSelf);
        make.height.offset(1);
    }];
}
@end
/***********地址信息*************/
@interface AddressMsgView ()
@property (strong, nonatomic) UIView *singleLine;

@property (strong, nonatomic) UILabel *titleLable;
@property (strong, nonatomic) UILabel *detailLable;
@end
@implementation AddressMsgView

- (UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.backgroundColor = [UIColor clearColor];//0.07
        _titleLable.textColor = [UIColor blackColor];
        _titleLable.textAlignment = NSTextAlignmentLeft;
        _titleLable.text = self.title;
        _titleLable.font = [UIFont systemFontOfSize:17];
        [self addSubview:_titleLable];
    }
    return _titleLable;
}
- (UILabel *)detailLable{
    if (!_detailLable) {
        _detailLable = [[UILabel alloc] init];
        _detailLable.backgroundColor = [UIColor clearColor];//0.07
        _detailLable.textColor = [UIColor blackColor];
        _detailLable.numberOfLines = 0;
        [self setdetailLableValue];
        _detailLable.textAlignment = NSTextAlignmentRight;
        _detailLable.font = [UIFont systemFontOfSize:17];
        [self addSubview:_detailLable];
    }
    return _detailLable;
}
- (UIView *)singleLine{
    if (!_singleLine) {
        _singleLine = [[UIView alloc] init];
        _singleLine.backgroundColor =RGBCOLOR(170, 170, 170);
        [self addSubview:_singleLine];
    }
    return _singleLine;
}
- (void)setdetailLableValue{
    _detailLable.text = self.detailtitile;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(weakSelf);
        make.right.equalTo(self.detailLable.mas_left).offset(- 5);
        make.left.equalTo(weakSelf.mas_left).offset(0.0226*(HEIGHT - BTN_H - NavH));
    }];
    
    [self.detailLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(weakSelf);
        make.right.equalTo(weakSelf.mas_right).offset(- 0.0532*(HEIGHT - BTN_H - NavH));
        make.width.offset(weakSelf.width/2);
    }];
    
    [self.singleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.width.left.equalTo(weakSelf);
        make.height.offset(1);
    }];
}
@end
/***********总计信息*************/
@interface TotalMsgView ()
@property (strong, nonatomic) UIView *singleLine;//下划线
@property (strong, nonatomic) UILabel *totalPriceLable;//总结
@property (strong, nonatomic) UILabel *priceExpLable;//价格
@property (strong, nonatomic) UILabel *postageExpLable;//运费
@property (strong, nonatomic) UILabel *totalExpLable;//总价
@property (strong, nonatomic) UILabel *priceLable;//¥600.00
@property (strong, nonatomic) UILabel *postageLable;//¥10.00
@property (strong, nonatomic) UILabel *totalLable;//¥610.00

@end
@implementation TotalMsgView
- (UIView *)singleLine{
    if (!_singleLine) {
        _singleLine = [[UIView alloc] init];
        _singleLine.backgroundColor =RGBCOLOR(170, 170, 170);
        [self addSubview:_singleLine];
    }
    return _singleLine;
}
- (UILabel *)totalPriceLable{
    if (!_totalPriceLable) {
        _totalPriceLable = [[UILabel alloc] init];
        _totalPriceLable.backgroundColor = [UIColor clearColor];//0.07
        _totalPriceLable.textColor = [UIColor blackColor];
        _totalPriceLable.textAlignment = NSTextAlignmentLeft;
        _totalPriceLable.text = self.total;
        _totalPriceLable.font = [UIFont systemFontOfSize:17];
        [self addSubview:_totalPriceLable];
    }
    return _totalPriceLable;
}
- (UILabel *)priceExpLable{
    if (!_priceExpLable) {
        _priceExpLable = [[UILabel alloc] init];
        _priceExpLable.backgroundColor = [UIColor clearColor];//0.07
        _priceExpLable.textColor = [UIColor blackColor];
        _priceExpLable.textAlignment = NSTextAlignmentLeft;
        _priceExpLable.text = self.priceExp;
        _priceExpLable.font = [UIFont systemFontOfSize:17];
        [self addSubview:_priceExpLable];
    }
    return _priceExpLable;
}
- (UILabel *)postageExpLable{
    if (!_postageExpLable) {
        _postageExpLable = [[UILabel alloc] init];
        _postageExpLable.backgroundColor = [UIColor clearColor];//0.07
        _postageExpLable.textColor = [UIColor blackColor];
        _postageExpLable.textAlignment = NSTextAlignmentLeft;
        _postageExpLable.text = self.postageExp;
        _postageExpLable.font = [UIFont systemFontOfSize:17];
        [self addSubview:_postageExpLable];
    }
    return _postageExpLable;
}
- (UILabel *)totalExpLable{
    if (!_totalExpLable) {
        _totalExpLable = [[UILabel alloc] init];
        _totalExpLable.backgroundColor = [UIColor clearColor];//0.07
        _totalExpLable.textColor = [UIColor blackColor];
        _totalExpLable.textAlignment = NSTextAlignmentLeft;
        _totalExpLable.text = self.totalExp;
        _totalExpLable.font = [UIFont systemFontOfSize:17];
        [self addSubview:_totalExpLable];
    }
    return _totalExpLable;
}
- (UILabel *)priceLable{
    if (!_priceLable) {
        _priceLable = [[UILabel alloc] init];
        _priceLable.backgroundColor = [UIColor clearColor];//0.07
        _priceLable.textColor = [UIColor blackColor];
        _priceLable.textAlignment = NSTextAlignmentRight;
        _priceLable.text = self.price;
        _priceLable.font = [UIFont systemFontOfSize:17];
        [self addSubview:_priceLable];
    }
    return _priceLable;
}
- (UILabel *)postageLable{
    if (!_postageLable) {
        _postageLable = [[UILabel alloc] init];
        _postageLable.backgroundColor = [UIColor clearColor];//0.07
        _postageLable.textColor = [UIColor blackColor];
        _postageLable.textAlignment = NSTextAlignmentRight;
        _postageLable.text = self.postage;
        _postageLable.font = [UIFont systemFontOfSize:17];
        [self addSubview:_postageLable];
    }
    return _postageLable;
}
- (UILabel *)totalLable{
    if (!_totalLable) {
        _totalLable = [[UILabel alloc] init];
        _totalLable.backgroundColor = [UIColor clearColor];//0.07
        _totalLable.textColor = [UIColor blackColor];
        _totalLable.textAlignment = NSTextAlignmentRight;
        _totalLable.text = self.totalprice;
        _totalLable.font = [UIFont systemFontOfSize:17];
        [self addSubview:_totalLable];
    }
    return _totalLable;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    
    [self.totalPriceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(0.0226*(HEIGHT - BTN_H - NavH));
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.width.offset(0.31*weakSelf.width);
    }];
    
    [self.priceExpLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_totalPriceLable.mas_top);
        make.left.equalTo(_totalPriceLable.mas_right).offset(5);
        make.right.equalTo(self.priceLable.mas_left).offset(- 5);
        make.height.offset(0.15*weakSelf.height);
    }];
    
    [self.postageExpLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_priceExpLable.mas_bottom);
        make.left.equalTo(_totalPriceLable.mas_right).offset(5);
        make.right.equalTo(self.postageLable.mas_left).offset(- 5);
        make.height.offset(0.15*weakSelf.height);
    }];
    
    [self.singleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_postageExpLable.mas_bottom).offset(0.03*weakSelf.height);
        make.left.equalTo(_postageExpLable.mas_left);
        make.width.offset(weakSelf.width);
        make.height.offset(1);
    }];
    
    [self.totalExpLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_singleLine.mas_bottom).offset(0.03*weakSelf.height);
        make.left.equalTo(_totalPriceLable.mas_right).offset(5);
        make.right.equalTo(self.totalLable.mas_left).offset(- 5);
        make.height.offset(0.15*weakSelf.height);
    }];
    
    [self.priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_totalPriceLable.mas_top);
        make.left.equalTo(self.priceExpLable.mas_right).offset(5);
        make.right.equalTo(weakSelf.mas_right).offset(- 0.0532*(HEIGHT - BTN_H - NavH));
        make.height.offset(0.15*weakSelf.height);//- 0.0532*(HEIGHT - BTN_H - NavH)
    }];
    
    [self.postageLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_priceExpLable.mas_bottom);
        make.left.equalTo(self.postageExpLable.mas_right).offset(5);
        make.right.equalTo(weakSelf.mas_right).offset(- 0.0532*(HEIGHT - BTN_H - NavH));
        make.height.offset(0.15*weakSelf.height);
    }];
    
    [self.totalLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_singleLine.mas_bottom).offset(0.03*weakSelf.height);
        make.left.equalTo(self.totalExpLable.mas_right).offset(5);
        make.right.equalTo(weakSelf.mas_right).offset(- 0.0532*(HEIGHT - BTN_H - NavH));
        make.height.offset(0.15*weakSelf.height);
    }];
    
}

@end

/***********确认订单*************/
@interface BuyGoodsView ()

@property (strong, nonatomic) GoodsMsgView *goodMsgView;
@property (strong, nonatomic) OrderMsgView *postageMsgView;
@property (strong, nonatomic) OrderMsgView *orderNumMsgView;
@property (strong, nonatomic) AddressMsgView *addressMsgView;
@property (strong, nonatomic) TotalMsgView *totalMsgView;


@property (strong, nonatomic) UITapGestureRecognizer *tagGes;

@end
@implementation BuyGoodsView

- (instancetype)init{
    if (self =[super init]) {
        [self viewdidload];
    }
    return self;
}

- (void)viewdidload{
    self.backgroundColor = [UIColor clearColor];
}
- (GoodsMsgView *)goodMsgView{
    if (!_goodMsgView) {
        _goodMsgView = [[GoodsMsgView alloc] init];
        _goodMsgView.backgroundColor = [UIColor clearColor];
        [self addSubview:_goodMsgView];
    }
    return _goodMsgView;
}

- (OrderMsgView *)postageMsgView{
    if (!_postageMsgView) {
        _postageMsgView = [[OrderMsgView alloc] init];
        _postageMsgView.backgroundColor = [UIColor clearColor];
        [self addSubview:_postageMsgView];
    }
    return _postageMsgView;
}

- (OrderMsgView *)orderNumMsgView{
    if (!_orderNumMsgView) {
        _orderNumMsgView = [[OrderMsgView alloc] init];
        _orderNumMsgView.backgroundColor = [UIColor clearColor];
        [self addSubview:_orderNumMsgView];
    }
    return _orderNumMsgView;
}
- (AddressMsgView *)addressMsgView{
    if (!_addressMsgView) {
        _addressMsgView = [[AddressMsgView alloc] init];
        _tagGes =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeAddressTap:)];
        [_addressMsgView addGestureRecognizer:_tagGes];
        _addressMsgView.backgroundColor = [UIColor clearColor];
        [self addSubview:_addressMsgView];
    }
    return _addressMsgView;
}
- (TotalMsgView *)totalMsgView{
    if (!_totalMsgView) {
        _totalMsgView = [[TotalMsgView alloc] init];
        _totalMsgView.backgroundColor = [UIColor clearColor];
        [self addSubview:_totalMsgView];
    }
    return _totalMsgView;
}
- (void)setModel:(PlaceOrderModel *)model{
        _model = model;
    //商品信息赋值
    self.goodMsgView.imageurl = model.imageUrl;
    self.goodMsgView.name = model.name;
    self.goodMsgView.descname = model.descname;
    self.goodMsgView.price = [@"¥" stringByAppendingString:model.price];
    //订单号和邮费赋值
    self.postageMsgView.title = @"邮费";
    self.postageMsgView.detailtitile = [@"¥" stringByAppendingString:model.postage];
    
    self.orderNumMsgView.title = @"订单号";
    self.orderNumMsgView.detailtitile = model.ordernum;
    
    //地址赋值
    self.addressMsgView.title = @"地址";
    self.addressMsgView.detailtitile = model.address;
    [self.addressMsgView setdetailLableValue];
    //总计赋值
    self.totalMsgView.total = @"总结";
    self.totalMsgView.postageExp = @"运费";
    self.totalMsgView.totalExp = @"总价";
    self.totalMsgView.priceExp = @"价格";
    self.totalMsgView.price = [@"¥" stringByAppendingString:model.price];
    self.totalMsgView.postage = [@"¥" stringByAppendingString:model.postage];
    self.totalMsgView.totalprice =[@"¥" stringByAppendingString:[NSString stringWithFormat:@"%.2f",[model.price floatValue] + [model.postage floatValue]]];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [self.goodMsgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(weakSelf);
        make.width.equalTo(weakSelf.mas_width);
        make.height.offset(weakSelf.height*0.2);
    }];

    [self.postageMsgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_goodMsgView.mas_bottom);
        make.left.right.equalTo(weakSelf);
        make.height.offset(weakSelf.height*0.1);
    }];
    [self.orderNumMsgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_postageMsgView.mas_bottom);
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(_postageMsgView);
    }];
    
    [self.addressMsgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_orderNumMsgView.mas_bottom);
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(_goodMsgView);
    }];
    [self.totalMsgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_addressMsgView.mas_bottom);
        make.left.right.equalTo(weakSelf);
        make.height.offset(weakSelf.height*0.4);
    }];
    /**
    self.goodMsgView.frame = CGRectMake(0, 0, self.width, 0.19*self.height);
     
     self.postageMsgView.frame = CGRectMake(0, _goodMsgView.height, self.width, 0.1*self.height);
     self.orderNumMsgView.frame =CGRectMake(0, _postageMsgView.y + _postageMsgView.height, self.width, 0.1*self.height);
     self.addressMsgView.frame = CGRectMake(0, _orderNumMsgView.y +_orderNumMsgView.height, self.width, 0.19*self.height);
     self.totalMsgView.frame = CGRectMake(0, _addressMsgView.y +_addressMsgView.height, self.width, self.height *0.28);
     *
     *  @return
     */
    
//    self.goodMsgView.imageurl = _model.imageUrl;
//    self.goodMsgView.name = _model.name;
//    self.goodMsgView.descname = _model.descname;
//    self.goodMsgView.price = _model.price;
    
}
- (void)changeAddressTap:(UITapGestureRecognizer *)tapGes{
    if ([self.delegate respondsToSelector:@selector(changeAddressWithGestureRecognizer)]) {
        [self.delegate changeAddressWithGestureRecognizer];
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
