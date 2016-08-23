//
//  LikeCollectionViewCell.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/18.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinGood.h"

@interface LikeCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *likegoodImage;
@property (weak, nonatomic) IBOutlet UILabel *likegoodLable;
- (void)setValueWithModel:(LikeGoodsModel *)model;
@end
