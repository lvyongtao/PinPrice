//
//  AddressViewController.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/17.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "RootViewController.h"

@class AddressModel;
typedef void(^AddressBuyBlock)(AddressModel *);
@interface AddressViewController : RootViewController


@property (copy, nonatomic) AddressBuyBlock addressBlock;
- (void)returnBuyGoodsViewController:(AddressBuyBlock )block;

@end
