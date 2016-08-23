//
//  AddressTableViewCell.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressModel.h"


@protocol AddressTableViewBtnDelegate <NSObject>
@required
- (void)AddressTableViewBtnClick:(NSInteger )type Tag:(NSInteger )index;
@end

typedef NS_ENUM(NSInteger, AddressTableViewBtnType){
    AddressTableViewBtnTypeDefault = 0,
    AddressTableViewBtnTypeEditing,
    AddressTableViewBtnTypeDelete
};

@interface AddressTableViewCell : UITableViewCell
@property (assign, nonatomic) AddressTableViewBtnType type;
@property (weak, nonatomic) id<AddressTableViewBtnDelegate >delegate;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;
@property (weak, nonatomic) IBOutlet UILabel *addressLable;
@property (weak, nonatomic) IBOutlet UILabel *lineLable;
@property (weak, nonatomic) IBOutlet UIButton *setDefaultBtn;
@property (weak, nonatomic) IBOutlet UIButton *editingBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

@property (strong, nonatomic) AddressModel *model;
@end
