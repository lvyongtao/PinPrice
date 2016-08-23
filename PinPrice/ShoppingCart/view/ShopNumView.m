//
//  ShopNumView.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/10.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//
#define cellH 150
#define SPACE_LINE 5
#import "ShopNumView.h"



@interface ShopNumView ()

@property (copy, nonatomic) NSString *numstring;

@property (assign, nonatomic) int num;

@end

@implementation ShopNumView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self viewdidload];
    }
    return self;
}
- (void)viewdidload{
    self.userInteractionEnabled = YES;
    float selfHeight = cellH*3/8 - SPACE_LINE*4;
    float selfWidth = WIDTH - cellH + SPACE_LINE*2 - SPACE_LINE*3;

    UIView*alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight)];
    alphaView.alpha = 0.2;
    alphaView.backgroundColor = [UIColor grayColor];
    [self addSubview:alphaView];
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.tag = 101;
    _rightBtn.backgroundColor = [UIColor clearColor];
    _rightBtn.adjustsImageWhenHighlighted = NO;
    [self addSubview:_rightBtn];
    __weak typeof(self) weakSelf = self;
    [_rightBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    _rightBtn.userInteractionEnabled = YES;
       //cellH*3/8 - SPACE_LINE*4
//    _rightBtn.frame = CGRectMake(selfWidth - selfHeight, 0, selfHeight, selfHeight);
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(selfHeight);
        make.right.equalTo(weakSelf.mas_right);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    [_rightBtn addTarget:self action:@selector(countChange:) forControlEvents:UIControlEventTouchUpInside];
    _numstring = @"1";
    _num = [_numstring intValue];
//    CGSize size = [PinMethod sizeWithString:_numstring fount:[UIFont systemFontOfSize:22] maxSize:CGSizeMake(21*3, 26)];
    _numLable = [[UILabel alloc] init];
    [self addSubview:_numLable];
    _numLable.backgroundColor = [UIColor clearColor];

    _numLable.text = _numstring;
    _numLable.font = [UIFont systemFontOfSize:22];
//    _numLable.backgroundColor = [UIColor clearColor];
    _numLable.textColor = [UIColor blackColor];
    _numLable.textAlignment = NSTextAlignmentCenter;
//    _numLable.frame = CGRectMake(selfHeight, 0, selfWidth - selfHeight*2, selfHeight);
    [_numLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_rightBtn.mas_left);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.width.offset(selfWidth - selfHeight*2);
        make.height.offset(selfHeight);
        
    }];
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.tag = 100;
    _leftBtn.adjustsImageWhenHighlighted = NO;
    _leftBtn.backgroundColor = [UIColor clearColor];
    [self addSubview:_leftBtn];
    _leftBtn.userInteractionEnabled = NO;
    [_leftBtn setImage:[UIImage imageNamed:@"reduceBlack"] forState:UIControlStateNormal];
    _leftBtn.frame = CGRectMake(0, 0, selfHeight, selfHeight);
//    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.offset(weakSelf.height);
//        make.right.equalTo(_numLable.mas_left).offset(- 10);
//        make.centerY.equalTo(weakSelf.mas_centerY);
//    }];
    [_leftBtn addTarget:self action:@selector(countChange:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)countChange:(UIButton *)btn{
    
    
    if (btn.tag == 101) {
        if (_num >= _maxNum - 1) {
            
            [_rightBtn setImage:[UIImage imageNamed:@"addBlack"] forState:UIControlStateNormal];
            [_leftBtn setImage:[UIImage imageNamed:@"reduce"] forState:UIControlStateNormal];
            _num = _maxNum;
        }else{
            _num = _num + 1;
            [_rightBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
            if (_num > 1) {
                [_leftBtn setImage:[UIImage imageNamed:@"reduce"] forState:UIControlStateNormal];
            }
        }
        
        
        
    }else if(btn.tag == 100){
        
        if (_num <= 2) {
            [_leftBtn setImage:[UIImage imageNamed:@"reduceBlack"] forState:UIControlStateNormal];
            _num = 1;
        }else{
            
            [_leftBtn setImage:[UIImage imageNamed:@"reduce"] forState:UIControlStateNormal];
            if (_num <= _maxNum) {
                [_rightBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
            }
            _num = _num - 1;
        }
        
    }
    
    if (_num >1 && _num < _maxNum) {
        _rightBtn.userInteractionEnabled = YES;
        _leftBtn.userInteractionEnabled = YES;
    }else if(_num <= 1){
        _leftBtn.userInteractionEnabled = NO;
        _rightBtn.userInteractionEnabled = YES;
    }else if(_num >= _maxNum){
        _rightBtn.userInteractionEnabled = NO;
        _leftBtn.userInteractionEnabled = YES;
    }
    _numLable.text = [NSString stringWithFormat:@"%d",_num];
    
    
    if ([self.delegate respondsToSelector:@selector(numButtonClickNumString:)]) {
        [self.delegate numButtonClickNumString:_numLable.text];
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
