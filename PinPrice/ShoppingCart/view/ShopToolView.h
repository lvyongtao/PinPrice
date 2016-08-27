//
//  ShopToolView.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/25.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ShopToolViewBtnType){
    ShopToolViewBtnTypeAllSelected = 0,//全选
    ShopToolViewBtnTypeClearing//结算
};
@protocol ShopToolViewBtnClickDelegate <NSObject>
@required
- (void)ShopToolViewBtnClickIndex:(ShopToolViewBtnType )index Selected:(BOOL )selected;


@end
@interface ShopToolView : UIView

@property (weak, nonatomic)id<ShopToolViewBtnClickDelegate >delegate;
//
@property (assign, nonatomic) ShopToolViewBtnType type;

- (void)setValueWithPrice:(NSString *)totalprice;
@end
