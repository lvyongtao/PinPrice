//
//  OrderTableViewCell.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "OrderTableViewCell.h"

@implementation OrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.bgView.backgroundColor = RGBCOLOR(228, 229, 230);
    // Initialization code
}
- (IBAction)logisticsBtnClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(OrderTableViewCelllogisticsButtonDelegate:)]) {
        [self.delegate OrderTableViewCelllogisticsButtonDelegate:sender.tag];
    }
}
- (IBAction)deleteBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(OrderTableViewCellDeleteButtonDelegate:)]) {
        [self.delegate OrderTableViewCellDeleteButtonDelegate:sender.tag];
    }
}
- (void)setValueWithModel:(OrderModel *)model{
     self.deleteBtn.tag = self.tag;
    self.logisticsBtn.tag = self.tag;
    if (model.imageUrl) {
        [_iconImage sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
    }
    if (model.title) {
        _titleLable.text = model.title;
    }
    if (model.desctitle) {
        _descLable.text = model.desctitle;
    }
    if (model.num) {
        _numLable.text = model.num;
    }
    if (model.price) {
        _priceLable.text = model.price;
    }
    if (model.brandtitle) {
        _brandLable.text = model.brandtitle;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
