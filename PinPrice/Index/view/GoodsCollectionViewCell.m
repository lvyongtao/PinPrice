//
//  GoodsCollectionViewCell.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/23.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "GoodsCollectionViewCell.h"

@implementation GoodsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.goodsImage.clipsToBounds = YES;
    // Initialization code
}
- (void)setModel:(RelatedGoodsListModel *)model{

    [_goodsImage sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
    if (model.price) {
        _priceLable.text = model.price;
    }
    if (model.name) {
        _nameLable.text = model.name;
    }

}
@end
