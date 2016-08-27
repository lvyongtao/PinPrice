//
//  PayCartTableViewCell.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/26.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "PayCartTableViewCell.h"

@implementation PayCartTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModel:(ShoppingModel *)model{
    _model = model;
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
    if (model.title) {
        _titleLable.text = model.title;
    }
    if (model.num) {
        _numLable.text = [NSString stringWithFormat:@"%d",model.num];
    }
    if (model.size) {
        _sizeLable.text = model.size;
    }
    if (model.price) {
        _priceLable.text = [NSString stringWithFormat:@"¥%.2f",[model.price floatValue]*model.num];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
