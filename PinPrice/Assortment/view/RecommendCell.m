//
//  RecommendCell.m
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "RecommendCell.h"

@implementation RecommendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imgaeView.clipsToBounds = YES;
    // Initialization code
}
- (void)setModel:(RecommendModel *)model{
    _model = model;
    if (model.imageUrl) {
         [_imgaeView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"login_bgImage"]];
    }
}
@end
