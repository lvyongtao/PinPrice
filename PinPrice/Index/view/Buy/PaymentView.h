//
//  PaymentView.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/29.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface PaymentTypeView : UIButton

@property (copy, nonatomic) NSString *payTypeTitle;
@property (copy, nonatomic) NSString *imageName;

- (void)hiddenImage:(BOOL )hidden;


@end

typedef NS_ENUM(NSInteger,PaymentViewClickType){
    PaymentViewClickTypeWeixin = 0,//支付宝
    PaymentViewClickTypeAliPay,//微信
    PaymentViewClickTypeNone
};

@protocol PaymentViewClickDelegate <NSObject>
@required
- (void)PaymentViewClickType:(PaymentViewClickType )type;

@end


@interface PaymentView : UIView

@property (weak, nonatomic) id<PaymentViewClickDelegate >delegate;


@property (assign, nonatomic) PaymentViewClickType type;

@property (copy, nonatomic) NSString *paymentTitle;






@end
