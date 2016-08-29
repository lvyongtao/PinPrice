//
//  QueryTableViewCell.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QueryOrderModel.h"

@interface QueryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *lineImageView;
@property (weak, nonatomic) IBOutlet UILabel *expressLable;
@property (weak, nonatomic) IBOutlet UILabel *orderIDLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLine;

@property (strong, nonatomic) QueryOrderModel *queryModel;



//- (void)setValueWithModel:(QueryOrderModel *)model;
@end
