//
//  OrderTableViewCell.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"


@protocol OrderCellButtonDelegate <NSObject>
@required
- (void)OrderTableViewCellDeleteButtonDelegate:(NSInteger )index;
@optional
- (void)OrderTableViewCelllogisticsButtonDelegate:(NSInteger )index;
@end

@interface OrderTableViewCell : UITableViewCell
@property (weak, nonatomic) id<OrderCellButtonDelegate >delegate;

@property (weak, nonatomic) IBOutlet UILabel *brandLable;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UILabel *descLable;
@property (weak, nonatomic) IBOutlet UIButton *logisticsBtn;

- (void)setValueWithModel:(OrderModel *)model;
@end
