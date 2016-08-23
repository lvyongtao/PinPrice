//
//  CollectTableViewCell.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/18.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "CollectTableViewCell.h"

@implementation CollectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    _sizeLable.layer.cornerRadius = 4.f;
    _sizeLable.layer.masksToBounds = YES;
    
    _stateLable.layer.borderWidth = 1.f;
    _stateLable.layer.borderColor = [[UIColor blackColor] CGColor];
    
    // Initialization code
}
- (void)setValueWithModel:(CollectModel *)model{
    
    if (model.imageUrl) {
        [_image sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
    }
    if (model.title) {
        _titleLable.text = model.title;
    }
    if (model.desctitle) {
        _desctitleLable.text = model.desctitle;
    }
    if (model.size) {
        _sizeLable.text = model.size;
    }
    if (model.price) {
        _priceLable.text = model.price;
    }
    if (model.state) {
        _stateLable.text = model.state;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
