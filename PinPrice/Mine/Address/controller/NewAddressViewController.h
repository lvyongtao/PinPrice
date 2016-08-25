//
//  NewAddressViewController.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "RootViewController.h"
#import "AddressModel.h"
typedef void(^AddressEditBlock)(AddressModel *);
@interface NewAddressViewController : RootViewController

@property (strong, nonatomic) AddressModel *model;

@property (copy, nonatomic) AddressEditBlock addressEdit;
- (void)returnAddressViewController:(AddressEditBlock )block;

@end
