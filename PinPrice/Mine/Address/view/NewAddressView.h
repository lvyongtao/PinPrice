//
//  NewAddressView.h
//  PinPrice
//
//  Created by lvyongtao on 16/8/22.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewAddressViewDelagete <NSObject>
@required
- (void)NewAddressViewEndEditingText:(NSString *)text Index:(NSInteger )index;

@end


@interface NewAddressView : UIView

@property (weak, nonatomic) id<NewAddressViewDelagete >delegate;


@property (copy, nonatomic) NSString *titleText;

@property (copy, nonatomic) NSString *detailText;

@end
