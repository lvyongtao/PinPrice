//
//  PayForCartViewController.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/25.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "RootViewController.h"
@protocol PayForCartViewControllerDelegate <NSObject>

- (void)presentedPayForCartViewControllerDissmiss;

- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent;

@end

@interface PayForCartViewController : RootViewController

@property (nonatomic, assign) id<PayForCartViewControllerDelegate > delegate;
//购物车列表
@property (strong, nonatomic) NSMutableArray *payGoods;

@end
