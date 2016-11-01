//
//  CollectModel.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/18.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "BaseModel.h"

@interface CollectModel : BaseModel<NSCoding>

@property (copy, nonatomic) NSString *imageUrl;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *desctitle;
@property (copy, nonatomic) NSString *size;
@property (copy, nonatomic) NSString *price;
@property (copy, nonatomic) NSString *state;


@end
