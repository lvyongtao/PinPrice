//
//  AllCollectionViewCell.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/18.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinGood.h"

@interface AllCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *allGoodImage;

- (void)setValueWithModel:(AllGoodsModel *)model;
@end
