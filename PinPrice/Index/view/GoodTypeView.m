//
//  GoodTypeView.m
//  PinPrice
//
//  Created by lvyongtao on 16/9/1.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "GoodTypeView.h"

@implementation GoodTypeView

- (UIImageView *)demoImage{
    if (!_demoImage) {
        _demoImage = [[UIImageView alloc] init];
        _demoImage.image = [UIImage imageNamed:@"Snip20160901_1"];
        [self addSubview:_demoImage];
    }
    return _demoImage;
}
- (void)layoutSubviews{
    [super layoutSubviews];
//    __weak typeof(self) weakSelf = self;
    self.demoImage.frame = CGRectMake(0, 0, self.width, self.height);
//    [self.demoImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.bottom.equalTo(weakSelf);
//    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
