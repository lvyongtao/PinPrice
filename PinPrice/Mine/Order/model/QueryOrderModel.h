//
//  QueryOrderModel.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "BaseModel.h"

@interface QueryOrderModel : BaseModel

@property (copy, nonatomic) NSString *imageUrl;
@property (copy, nonatomic) NSString *express;
@property (copy, nonatomic) NSString *orderid;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *time;


@end
