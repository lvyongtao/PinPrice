//
//  PayCartModel.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/26.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "BaseModel.h"

@interface PayCartModel : BaseModel

@property (copy, nonatomic) NSString *imageurl;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *num;
@property (copy, nonatomic) NSString *size;
@property (copy, nonatomic) NSString *price;

@end
