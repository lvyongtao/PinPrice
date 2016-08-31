//
//  ShopNumView.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/10.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShopNumDelegate <NSObject>
@required
- (void)numButtonClickNumString:(NSString *)numString;

@end

@interface ShopNumView : UIView

@property (weak, nonatomic) id<ShopNumDelegate >delegate;
/**
 *  加减按钮
 */
@property (strong, nonatomic) UIButton *leftBtn;
@property (strong, nonatomic) UIButton *rightBtn;
/**
 *  购买的数量显示
 */
@property (strong, nonatomic) UILabel *numLable;
/**
 *  购买最大数量
 */
@property (assign, nonatomic) int maxNum;

- (void)viewdidload;
@end
