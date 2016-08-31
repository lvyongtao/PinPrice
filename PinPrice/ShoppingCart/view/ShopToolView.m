//
//  ShopToolView.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/25.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define ALLSELECTEDBTN_W 82
#define CLEARINGBTN_W 92
#import "ShopToolView.h"
#import "ShoppingModel.h"
@interface ShopToolView ()
//全选按钮
@property (strong, nonatomic) UIButton *allSelectedBtn;
//总计
@property (strong, nonatomic) UILabel *totalPriceLable;
//结算
@property (strong, nonatomic) UIButton *clearingBtn;
//
@property (strong, nonatomic) ShoppingModel *model;

@end

@implementation ShopToolView
- (instancetype)init{
    if (self =[super init]) {
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.000];
    }
    return self;
}
- (ShoppingModel *)model{
    if (!_model) {
        _model = [[ShoppingModel alloc] init];
    }
    return _model;
}
- (UIButton *)allSelectedBtn{
    if (!_allSelectedBtn) {
        _allSelectedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _allSelectedBtn.backgroundColor = [UIColor clearColor];
        _allSelectedBtn.tag = 0;
        [_allSelectedBtn setImage:[UIImage imageNamed:@"shop_selectedn"] forState:UIControlStateNormal];
        [_allSelectedBtn setTitle:@"全选" forState:UIControlStateNormal];
        [_allSelectedBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
        [_allSelectedBtn setTitleColor:PinBaseBtnGreenColor forState:UIControlStateNormal];
        _allSelectedBtn.userInteractionEnabled = YES;
        [_allSelectedBtn addTarget:self action:@selector(addAddressBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_allSelectedBtn];
    }
    return _allSelectedBtn;
}

- (UILabel *)totalPriceLable{
    if (!_totalPriceLable) {
        _totalPriceLable = [[UILabel alloc] init];
        _totalPriceLable.backgroundColor = [UIColor clearColor];//0.07
        _totalPriceLable.textColor = PinBaseBtnGreenColor;
        _totalPriceLable.textAlignment = NSTextAlignmentCenter;
        _totalPriceLable.font = [UIFont systemFontOfSize:18];
        [self addSubview:_totalPriceLable];
    }
    return _totalPriceLable;
}

- (UIButton *)clearingBtn{
    if (!_clearingBtn) {
        _clearingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _clearingBtn.backgroundColor = RGBCOLOR(0,160,234);
        _clearingBtn.tag = 1;
        [_clearingBtn setTitle:@"结算" forState:UIControlStateNormal];
        [_clearingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _clearingBtn.userInteractionEnabled = YES;
        [_clearingBtn addTarget:self action:@selector(addAddressBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_clearingBtn];
    }
    return _clearingBtn;
}
- (void)setValueWithPrice:(NSString *)totalprice{
    self.totalPriceLable.text = [NSString stringWithFormat:@"合计：¥%@",totalprice];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [self.allSelectedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(weakSelf);
        make.width.offset(ALLSELECTEDBTN_W);
//        make.right.equalTo(weakSelf.totalPriceLable.mas_left).offset(- 5);
    }];
    
    [self.totalPriceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf);
        make.left.equalTo(_allSelectedBtn.mas_right).offset(5);
        make.right.equalTo(weakSelf.clearingBtn.mas_left).offset(- 5);
    }];
    
    [self.clearingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(weakSelf);
        make.width.offset(CLEARINGBTN_W);
//        make.left.equalTo(weakSelf.totalPriceLable.mas_right).offset(5);
    }];
}
- (void)addAddressBtnClick:(UIButton *)btn{
    switch (btn.tag) {
        case 0:
            btn.selected =! btn.selected;
            if (btn.selected) {
               [_allSelectedBtn setImage:[UIImage imageNamed:@"shop_selected"] forState:UIControlStateNormal];
            }else{
                [_allSelectedBtn setImage:[UIImage imageNamed:@"shop_selectedn"] forState:UIControlStateNormal];
            }
            self.type = ShopToolViewBtnTypeAllSelected;
            break;
        case 1:
            self.type = ShopToolViewBtnTypeClearing;
            break;
            
        default:
            break;
    }
    if ([_delegate respondsToSelector:@selector(ShopToolViewBtnClickIndex: Selected:)]) {
        [_delegate ShopToolViewBtnClickIndex:self.type Selected:btn.selected];
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
