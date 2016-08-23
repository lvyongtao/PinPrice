//
//  GoodsCollectionViewCell.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/23.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinGood.h"

@interface GoodsCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *goodsImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;

@property (strong, nonatomic) RelatedGoodsListModel *model;

@end
