//
//  AddressModel.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "BaseModel.h"

@interface AddressModel : BaseModel

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *name;

@end
