//
//  OrderSelectedView.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OrderSelectedViewsegementedDelegate <NSObject>
@required
- (void)OrderSelectedViewsegementedEventValueChanged:(NSInteger )index;
@end

@interface OrderSelectedView : UIView

@property (weak, nonatomic) id<OrderSelectedViewsegementedDelegate >delegate;

@property (strong, nonatomic) UISegmentedControl *segemented;
@property (strong, nonatomic) NSArray *titles;

@end
