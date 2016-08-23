//
//  GoodDetaiView.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/23.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinGood.h"

typedef NS_ENUM(NSInteger,BtnActionType){
    BtnActionTypeBuy = 0,
    BtnActionTypeCart,
    BtnActionTypeDetail
};
@protocol GoodDetaiViewBtnActionDelegate <NSObject>
@required
- (void)GoodDetaiViewBtnAction:(BtnActionType )type;

@end

@interface GoodDetaiView : UIView

@property (weak, nonatomic) id<GoodDetaiViewBtnActionDelegate >delegate;

@property (assign, nonatomic) BtnActionType type;

@property (strong, nonatomic) DetailGoodsModel *model;
@property (strong, nonatomic) NSArray *btnTitles;
@property (copy, nonatomic) NSString *reloatedText;

@end
