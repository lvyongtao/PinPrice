//
//  UITableView+EmptyTableView.m
//  FitnessUser
//
//  Created by user on 16/2/19.
//  Copyright © 2016年 wangjiajia. All rights reserved.
//

#import "UITableView+EmptyTableView.h"

@interface UITableView ()



@end
@implementation UITableView (EmptyTableView)

- (void)tableViewEmptyWithMsg:(NSString *)message ifNeedTableCount:(NSUInteger)rowCount{
    if (rowCount == 0) {
        UILabel *emptyLable = [[UILabel alloc] init];
        emptyLable.text = message;
//        emptyLable.backgroundColor = [UIColor redColor];
        emptyLable.textColor = [UIColor blackColor];
        emptyLable.textAlignment = NSTextAlignmentCenter;
        [emptyLable sizeToFit];
        self.backgroundView = emptyLable;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;

    }else{
        self.backgroundView = nil;
//        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    
}

@end
