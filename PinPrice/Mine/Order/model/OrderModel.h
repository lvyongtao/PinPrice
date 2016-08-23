//
//  OrderModel.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "BaseModel.h"

@interface OrderModel : BaseModel

@property (copy, nonatomic) NSString *brandtitle;
@property (copy, nonatomic) NSString *imageUrl;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *desctitle;
@property (copy, nonatomic) NSString *price;
@property (copy, nonatomic) NSString *num;

@end
