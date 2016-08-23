//
//  TypeCollectionViewCell.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/17.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AssertmentModel.h"

@interface TypeCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *typeImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;

- (void)setValueWithModel:(AssertmentModel *)model;
@end
