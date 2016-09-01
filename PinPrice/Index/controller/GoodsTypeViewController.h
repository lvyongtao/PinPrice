//
//  GoodsTypeViewController.h
//  PinPrice
//
//  Created by lvyongtao on 16/9/1.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "RootViewController.h"

typedef NS_ENUM(NSInteger,GoodsViewDissMissType){
    GoodsViewDissMissTypeBack = 0,
    GoodsViewDissMissTypeOk
};
@protocol GoodsTypeViewControllerDelegate <NSObject>

- (void)presentedGoodsTypeViewControllerDissmissWithType:(GoodsViewDissMissType )type;

- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent;

@end
//商品类型
@interface GoodsTypeViewController : RootViewController
@property (nonatomic, assign) id<GoodsTypeViewControllerDelegate > delegate;

@property (assign, nonatomic) GoodsViewDissMissType backType;
@end
