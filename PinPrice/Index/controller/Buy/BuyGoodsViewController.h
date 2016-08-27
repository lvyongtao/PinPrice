//
//  BuyGoodsViewController.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/23.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "RootViewController.h"

//商品信息确认界面
@interface BuyGoodsViewController : RootViewController

@property (strong, nonatomic) PlaceOrderModel *model;

//0直接购买 1购物车购买
@property (assign, nonatomic) NSInteger type;

@end
