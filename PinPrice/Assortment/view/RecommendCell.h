//
//  RecommendCell.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"

@interface RecommendCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgaeView;

@property (strong, nonatomic) RecommendModel *model;

@end
