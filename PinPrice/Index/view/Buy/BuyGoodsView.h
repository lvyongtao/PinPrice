//
//  BuyGoodsView.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/24.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  商品信息
 */
@interface GoodsMsgView: UIView

@property (copy, nonatomic) NSString *imageurl;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *descname;
@property (copy, nonatomic) NSString *price;

@end
/**
 *  订单信息
 */
@interface OrderMsgView: UIView

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *detailtitile;
@end
/**
 *   地址信息
 */
@interface AddressMsgView: UIView

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *detailtitile;

- (void)setdetailLableValue;

@end
/**
 *  总计信息
 */
@interface TotalMsgView: UIView
@property (copy, nonatomic) NSString *totalprice;
@property (copy, nonatomic) NSString *totalExp;
@property (copy, nonatomic) NSString *priceExp;
@property (copy, nonatomic) NSString *postageExp;
@property (copy, nonatomic) NSString *price;
@property (copy, nonatomic) NSString *postage;
@property (copy, nonatomic) NSString *total;

@end
/**
 *  确认订单
 */
@protocol AddressMsgViewDelegate <NSObject>
@required
- (void)changeAddressWithGestureRecognizer;

@end
@interface BuyGoodsView : UIView

@property (weak, nonatomic) id<AddressMsgViewDelegate >delegate;

@property (strong, nonatomic) PlaceOrderModel *model;


@end
