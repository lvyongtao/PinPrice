//
//  PayCartTableViewCell.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/26.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingModel.h"

@interface PayCartTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UILabel *sizeLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;



@property (strong, nonatomic)ShoppingModel *model;

@end
