//
//  TypeCollectionViewCell.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/17.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "TypeCollectionViewCell.h"

@implementation TypeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.typeImage.clipsToBounds = YES;
    // Initialization code
}
- (void)setValueWithModel:(AssertmentModel *)model{
    if (model.imageUrl) {
        [_typeImage sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
    }
    if (model.name) {
        _nameLable.text = model.name;
    }
}
@end
