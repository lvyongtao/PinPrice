//
//  UITableView+EmptyTableView.h
//  FitnessUser
//
//  Created by user on 16/2/19.
//  Copyright © 2016年 wangjiajia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
@interface UITableView (EmptyTableView)

/**
 *  没有数据显示的时候的页面
 *
 *  @param message  提示的文字
 *  @param rowCount  接受到的数据的长度是否为0  为0 显示空视图  不为0 显示有数据的视图
 */

- (void)tableViewEmptyWithMsg:(NSString *)message ifNeedTableCount:(NSUInteger)rowCount;
@end
