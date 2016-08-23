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

@property (strong, nonatomic) UIButton *leftBtn;

@property (strong, nonatomic) UIButton *rightBtn;

@property (strong, nonatomic) UILabel *numLable;

@property (assign, nonatomic) int maxNum;

- (void)viewdidload;
@end
