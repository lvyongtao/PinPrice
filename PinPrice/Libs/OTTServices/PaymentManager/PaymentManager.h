//
//  PaymentManager.h
//  PinPrice
//
//  Created by lvyongtao on 16/9/2.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "BaseModel.h"

@interface PaymentManager : BaseModel

+ (instancetype)shareManager;

/**
 *  调用微信支付
 */
- (void)WeiXinPaymentManager;
/**
 *  调用支付宝支付
 */
- (void)AlipayPaymentManager;

@end
