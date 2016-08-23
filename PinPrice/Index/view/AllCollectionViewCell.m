//
//  AllCollectionViewCell.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/18.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "AllCollectionViewCell.h"

@implementation AllCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.allGoodImage.clipsToBounds = YES;
    // Initialization code
}
- (void)setValueWithModel:(AllGoodsModel *)model{
    if (model.allGoodimageUrl) {
        [_allGoodImage sd_setImageWithURL:[NSURL URLWithString:model.allGoodimageUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
    }
}
@end
