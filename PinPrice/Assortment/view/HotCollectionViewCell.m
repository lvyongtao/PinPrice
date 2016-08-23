//
//  HotCollectionViewCell.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "HotCollectionViewCell.h"

@implementation HotCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"%zi",self.tag);
    self.bgView.layer.borderWidth = 1.f;
    self.bgView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.imageView.clipsToBounds = YES;
    // Initialization code
}
- (void)setModel:(HotModel *)model{
    _model = model;
    if (model.imageUrl) {
        [_imageView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
    }
    if (model.title) {
        _titleLable.text = model.title;
    }
    if (model.type) {
        _typeLable.text = model.type;
    }
    if (model.price) {
        _priceLable.text = model.price;
    }
}
@end
