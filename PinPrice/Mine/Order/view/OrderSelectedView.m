//
//  OrderSelectedView.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "OrderSelectedView.h"

@implementation OrderSelectedView

- (instancetype)init{
    if (self =[super init]) {
        self.backgroundColor = [UIColor grayColor];
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.segemented .backgroundColor = [UIColor whiteColor];
}

- (UISegmentedControl *)segemented{
    if (!_segemented) {
            _segemented = [[UISegmentedControl alloc] initWithItems:self.titles];
            _segemented.frame = CGRectMake(0.05*WIDTH, self.height/6, self.width - 0.1*WIDTH, self.height*2/3);
            _segemented.centerX = self.centerX;
            _segemented.centerY = self.centerY;
            _segemented.layer.cornerRadius = 4.f;
            _segemented.layer.masksToBounds = YES;
            _segemented.layer.borderWidth = 1.f;
            _segemented.layer.borderColor = [[UIColor grayColor]CGColor];
            _segemented.selectedSegmentIndex = 0;
            [_segemented setTintColor:RGBCOLOR(50, 158, 237)];
            _segemented.apportionsSegmentWidthsByContent = YES;
            [_segemented addTarget:self action:@selector(segementedAction:) forControlEvents:UIControlEventValueChanged];
            [self addSubview:_segemented];
        }
    return _segemented;
}
- (void)segementedAction:(UISegmentedControl *)segement{
    if ([self.delegate respondsToSelector:@selector(OrderSelectedViewsegementedEventValueChanged:)]) {
        [self.delegate OrderSelectedViewsegementedEventValueChanged:segement.selectedSegmentIndex];
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
