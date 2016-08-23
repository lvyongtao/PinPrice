//
//  QueryTableViewCell.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "QueryTableViewCell.h"

@implementation QueryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor grayColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}
- (void)setQueryModel:(QueryOrderModel *)queryModel{
    _queryModel = queryModel;
    if (queryModel.address) {
        _expressLable.text = queryModel.address;
    }
    if (queryModel.time) {
        _orderIDLable.text = queryModel.orderid;
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;

    totalHeight += [self.expressLable sizeThatFits:size].height;
    totalHeight += [self.orderIDLable sizeThatFits:size].height;
    totalHeight += 40; // margins
    if (totalHeight <= [self.lineImageView sizeThatFits:size].height) {
        return CGSizeMake(size.width, [self.lineImageView sizeThatFits:size].height);
    }
    return CGSizeMake(size.width, totalHeight);
}



//- (void)setValueWithModel:(QueryOrderModel *)model{
//    if (model.address) {
//        _expressLable.text = model.address;
//    }
//    if (model.time) {
//        _orderIDLable.text = model.orderid;
//    }
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
