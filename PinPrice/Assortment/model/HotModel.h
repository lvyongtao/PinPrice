//
//  HotModel.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "BaseModel.h"
//热卖model
@interface HotModel : BaseModel

@property (copy, nonatomic) NSString *imageUrl;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *price;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *name;

@end
