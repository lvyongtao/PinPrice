//
//  LikeCollectionViewCell.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/18.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "LikeCollectionViewCell.h"

@implementation LikeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.likegoodImage.clipsToBounds = YES;
    self.likegoodImage.layer.cornerRadius = 4.f;
    self.likegoodImage.layer.masksToBounds = YES;
    self.likegoodImage.backgroundColor =[UIColor clearColor];
    
    // Initialization code
}
- (void)setValueWithModel:(LikeGoodsModel *)model{
    
    [_likegoodImage sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];

    if (model.name) {
        _likegoodLable.text = model.name;
    }
   
}

@end
