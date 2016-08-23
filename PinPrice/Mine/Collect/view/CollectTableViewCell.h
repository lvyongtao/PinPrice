//
//  CollectTableViewCell.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/18.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectModel.h"

@interface CollectTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *desctitleLable;

@property (weak, nonatomic) IBOutlet UILabel *sizeLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *stateLable;

- (void)setValueWithModel:(CollectModel *)model;
@end
